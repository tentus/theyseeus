local sti = require "libraries.sti"

WorldScene = {
    entered = false,
    entityLayers = {
        "Minotaurs", "Pickups", "Misc", "Player"
    },
    navPoints = {},      -- places the Minotaurs will wander to
    showMap = false,
    transition = 0,
    transitionLength = 0.25,
    enteringFrom = "Start",
    background = {
        padding = 8, -- number of tiles on each side we add to the background
        -- batch = SpriteBatch,
    },
    -- map = sti map,
    -- physics = physics world,
    -- player = Player instance,
}

function WorldScene:init()
    -- populate our region arrangement from a whitelist of maps
    RegionManager:init()
    WeatherManager:init()

    love.physics.setMeter(64)

    -- special case for init
    self:loadRegion("Start")
end

function WorldScene:update(dt)
    if Bindings:pressed('cancel') then
        Gamestate.switch(MenuScene)
    end

    if self.transition > 0 then
        self.transition = self.transition - dt
        if self.transition <= 0 then
            self:loadRegion(self.enteringFrom)
            WeatherManager:reroll()
        end
        return
    end

    WeatherManager:update(dt)
    DaylightManager:update(dt)
    self.physics:update(dt)
    self.map:update(dt)

    self:changeRegion()

    Logger:add("Playtime", dt)

    -- now that we're done with other updates, bring our your dead
    for _, entType in pairs(self.entityLayers) do
        local layer = self.map.layers[entType]
        for k, ent in pairs(layer.ents) do
            if ent.dead then
                if ent.body then
                    ent.body:destroy()
                end
                table.remove(layer.ents, k)
            end
        end
    end
end

function WorldScene:draw()
    love.graphics.push()

    -- determine how much we need to translate around to see the player
    local width, height = love.window.getMode()
    local tx = (width / 2) - self.player.body:getX()
    local ty = (height / 2) - self.player.body:getY()
    love.graphics.translate(tx, ty)

    if self.background.batch then
        love.graphics.draw(self.background.batch, self.background.x, self.background.y)
    end

    -- Draw map
    self.map:draw(tx, ty)

    love.graphics.pop()

    if self.showMap then
        RegionManager:draw()
    end

    WeatherManager:draw()
    DaylightManager:draw()
    HUD:draw()
    Fader:draw()
    FPS:draw()
end

function WorldScene:keypressed(key)
    if key == "p" then
        self.showMap = not self.showMap
    end
end

function WorldScene:enter()
    self.entered = true
    self.map:resize(love.window.getMode())
end

function WorldScene:resize(w, h)
    self.map:resize(w, h)
end

function WorldScene:onScreen(x, y)
    local w, h = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2
    local px, py = self.player.body:getPosition()
    return not (x < px-w or x > px+w or y < py-h or y > py+h)
end

function WorldScene:findSpawn(name)
    for _, object in pairs(self.map.objects) do
        if object.name == name then
            return object
        end
    end
end

function WorldScene:loadRegion(enteringFrom)
    -- Load map
    self.map = sti("maps/" .. RegionManager:current().chosen .. ".lua", {"box2d"})
    self:setBackground(self.map)

    -- Prepare physics world
    self.physics = love.physics.newWorld(0, 0)

    local function beginContact(a, b, c)
        -- we bind the entities to their fixture userdata, so they can handle their own logic on collision
        if a.getUserData then a = a:getUserData() end
        if b.getUserData then b = b:getUserData() end
        if a and a.beginContact then a:beginContact(b, c) end
        if b and b.beginContact then b:beginContact(a, c) end
    end
    self.physics:setCallbacks(beginContact)    -- omitting other callbacks for brevity

    self.map:box2d_init(self.physics)

    -- entities are rendered & updated by map layers they spawn from
    for _, entType in pairs(self.entityLayers) do
        local layer = self.map.layers[entType]
        layer.ents = {}
        function layer:update(dt)
            for k, ent in pairs(self.ents) do
                if not ent.dead and ent.update then
                    ent:update(dt)
                end
            end
        end
        function layer:draw()
            for _, ent in pairs(self.ents) do
                if ent.draw then
                    ent:draw()
                end
            end
        end
    end

    self:spawnEntities()

    -- create our player instance based on the spawn points we just created
    local spawn = self:findSpawn(enteringFrom)
    if not self.player then
        self.player = Player(self.physics, spawn.x, spawn.y)
    else
        self.player:createBody(self.physics, spawn.x, spawn.y)
    end

    -- since we persist the player outside the normal layers we have to alias it back in too
    self.map.layers["Player"].ents = {
        self.player
    }

    -- calculate what can be walked on and rig up a pathfinder
    self.pathManager = PathManager(self.map)

    Fader:start(255, self.transitionLength)

    Logger:add("Transitions")
end

function WorldScene:spawnEntities()
    -- define some types that can be treated the same
    local inventory = {
        Yarn = 1, Upgrade = 1, Map = 1, Gem = 1,
    }
    local misc = {
        Sign = 1, Kid = 1,
    }

    self.navPoints = {}

    for _, object in pairs(self.map.objects) do
        -- we'll use npc spawn points as well as explicit NavPoints to make the npcs wander
        if object.type == "NPC" or object.type == "NavPoint"  then
            table.insert(self.navPoints, NavPoint(object.x, object.y))
        end

        local obj, entType
        if object.type == "NPC" then
            entType = "Minotaurs"
            obj = NPC(self.physics, object.x, object.y)
            Logger:add("NPCs Spawned")
        elseif object.type == "Health" then
            entType = "Pickups"
            obj = Health(object.x, object.y)
        elseif inventory[object.type] then
            if RegionManager:current()[object.type] and not InventoryManager:has(object.type, RegionManager:coords()) then
                entType = "Pickups"
                obj = _G[object.type](object.x, object.y)
            end
        elseif misc[object.type] then
            entType = "Misc"
            obj = _G[object.type](self.physics, object.x, object.y, object.name)
        end

        if obj then
            table.insert(self.map.layers[entType].ents, obj)
        end
    end
end

function WorldScene:changeRegion()
    local buffer = 512
    local x, y = self.player.body:getPosition()
    local df, dx, dy = nil, 0, 0

    if x < buffer then
        dx = -1
        df = "East"
    elseif x > (self.map.width * self.map.tilewidth) - buffer then
        dx = 1
        df = "West"
    end

    if y < buffer then
        dy = -1
        df = "South"
    elseif y > (self.map.height * self.map.tileheight) - buffer then
        dy = 1
        df = "North"
    end

    if df then
        RegionManager:move(dx, dy)
        Fader:start(0, self.transitionLength)
        self.transition = self.transitionLength
        self.enteringFrom = df
    end
end

function WorldScene:setBackground(map)
    local firstTile = function(map)
        for _, layer in pairs(map.layers) do
            if layer.type == "tilelayer" then
                for y=1, map.height do
                    for x=1, map.width do
                        if layer.data[y][x] then return layer.data[y][x] end
                    end
                end
            end
        end
    end
    local tile = firstTile(map)

    if tile then
        local bg = self.background
        local w = (bg.padding * 2) + map.width
        local h = (bg.padding * 2) + map.height
        bg.batch = love.graphics.newSpriteBatch(
            map.tilesets[tile.tileset].image, w * h
        )
        bg.x = -bg.padding * map.tilewidth
        bg.y = -bg.padding * map.tileheight
        for y=0, (h - 1) do
            for x=0, (w - 1) do
                bg.batch:add(tile.quad, x * map.tilewidth, y * map.tileheight)
            end
        end
    end
end
