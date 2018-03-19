local sti = require 'libraries.sti'

WorldScene = {
    entered = false,
    entityLayers = {
        'Minotaurs', 'Pickups', 'Misc',
    },
    navPoints = {},      -- places the Minotaurs will wander to
    transition = 0,
    transitionLength = 0.25,
    enteringFrom = 'Start',
    -- background = BackgroundLayer,
    -- camera = Camera,
    -- map = sti map,
    -- physics = physics world,
    -- player = Player instance,
}

function WorldScene:init()
    -- populate our region arrangement from a whitelist of maps
    RegionManager:init()

    love.physics.setMeter(64)

    self.player = Player()
    self.camera = Camera(self.player)

    -- special case for init
    self:loadRegion('Start')
end

function WorldScene:update(dt)
    if Bindings:pressed('cancel') then
        Gamestate.pop()
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
    self.camera:update(dt)
    self.physics:update(dt)
    self.map:update(dt)

    self:changeRegion()

    Logger:add('Playtime', dt)

    -- now that we're done with other updates, bring our your dead
    for _, entityLayer in pairs(self.entityLayers) do
        local ents = self:namedLayer(entityLayer).ents
        for k, ent in pairs(ents) do
            if ent.dead then
                if ent.body then
                    ent.body:destroy()
                end
                table.remove(ents, k)
            end
        end
    end
end

function WorldScene:draw()
    -- sort all minotaurs by their Y position
    table.sort(self:namedLayer('Minotaurs').ents, function (a, b)
        return a.body and b.body and a.body:getY() < b.body:getY()
    end)

    -- determine how much we need to translate around to see the player
    local tx, ty = self.camera:translate()

    self.background:draw(tx, ty)

    -- Draw map
    self.map:draw(tx, ty)

    WeatherManager:draw()
    DaylightManager:draw()
    HUD:draw()
    Fader:draw()
    HUD:drawFPS()
end

function WorldScene:keypressed(key)
    if key == 'p' then
        HUD:toggle('map')
    end
end

function WorldScene:enter()
    self.entered = true
    self:resize(love.window.getMode())
end

function WorldScene:resize(w, h)
    self.map:resize(w, h)
    self.background:fillBatch()
end

function WorldScene:loadRegion(enteringFrom)
    -- Load map
    self.map = sti("maps/" .. RegionManager:currentCell().chosen .. ".lua", {"box2d"})
    self.background = BackgroundLayer(self.map)

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
    for _, entityLayer in pairs(self.entityLayers) do
        local layer = self:namedLayer(entityLayer)
        layer.ents = {}
        function layer:update(dt)
            for _, ent in pairs(self.ents) do
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

    -- create a body for the player based on the names of the spawn points
    for _, object in pairs(self.map.objects) do
        if object.type == 'Spawn' and object.name == enteringFrom then
            self.player:createBody(self.physics, object.x, object.y)
            break
        end
    end

    -- since we persist the player outside the normal layers we have to alias it back in too
    self:namedLayer('Minotaurs').ents = {
        self.player
    }

    self:spawnEntities()

    self.camera:jump()

    -- calculate what can be walked on and rig up a pathfinder
    self.pathManager = PathManager(self.map)

    Fader:start(255, self.transitionLength)

    Logger:add('Transitions')

    -- now is a good time to clean up unreachable data.
    -- without this, the texturememory can double over the course of a normal session
    collectgarbage()
end

function WorldScene:spawnEntities()
    -- define some types that can be treated the same
    local pickups = {
        Health = 1, Coin = 1,
    }
    local inventory = {
         Yarn = 1, Upgrade = 1, Map = 1, Gem = 1, Horn = 1, Magnet = 1,
    }
    local misc = {
        Sign = 1, Kid = 1,
        SpikeTrap = 1, ArrowTrap = 1, BombTrap = 1
    }

    self.navPoints = {}

    local function snapToGrid(object)
        local function snap(value, grid)
            return value - (value % grid) + (grid / 2)
        end
        return snap(object.x, self.map.tilewidth), snap(object.y, self.map.tileheight)
    end

    local yarn = InventoryManager:total(Yarn.classname)

    for _, object in pairs(self.map.objects) do
        -- we'll use npc spawn points as well as explicit NavPoints to make the npcs wander
        if object.type == NPC.classname or object.type == NavPoint.classname  then
            table.insert(self.navPoints, NavPoint(snapToGrid(object)))
        end

        if object.type == NPC.classname then
            -- ramp up the difficulty by spawning more minotaurs as we find more yarn
            if yarn >= tonumber(object.name) then
                local x, y = snapToGrid(object)
                self:addEnt('Minotaurs', NPC(self.physics, x, y))
                Logger:add('NPCs Spawned')
            end
        elseif pickups[object.type] then
            self:addEnt('Pickups', _G[object.type](object.x, object.y))
        elseif inventory[object.type] then
            if RegionManager:currentCell()[object.type] and not InventoryManager:has(object.type) then
                self:addEnt('Pickups', _G[object.type](object.x, object.y))
            end
        elseif object.type == Freeze.classname then
            if love.math.random(Freeze.chance) == 1 then
                self:addEnt('Pickups', Freeze(object.x, object.y))
            end
        elseif misc[object.type] then
            local x, y = snapToGrid(object)
            self:addEnt('Misc', _G[object.type](self.physics, x, y, object.name))
        elseif object.type == Toll.classname then
            if not InventoryManager:has(object.type) then
                self:addEnt(Toll.layer, Toll(self.physics, object.x, object.y, object.width, object.height))
            end
        elseif object.type == Portal.classname then
            if RegionManager:currentCell()[Portal.classname] then
                self:addEnt('Misc', Portal(object.x, object.y))
            end
        elseif object.type == Teleport.classname then
            local x, y = snapToGrid(object.polyline[1])
            local dx, dy = snapToGrid(object.polyline[2])
            self:addEnt('Misc', Teleport(x, y, dx, dy))
        end
    end
end

function WorldScene:addEnt(layer, ent)
    table.insert(self:namedLayer(layer).ents, ent)
end

function WorldScene:namedLayer(layer)
    return self.map.layers[layer]
end

function WorldScene:changeRegion()
    local buffer = 512
    local x, y = self:playerPosition()
    local df, dx, dy = nil, 0, 0

    if x < buffer then
        dx = -1
        df = 'East'
    elseif x > (self.map.width * self.map.tilewidth) - buffer then
        dx = 1
        df = 'West'
    end

    if y < buffer then
        dy = -1
        df = 'South'
    elseif y > (self.map.height * self.map.tileheight) - buffer then
        dy = 1
        df = 'North'
    end

    if df then
        RegionManager:move(dx, dy)
        self:startTransition(df)
    end
end

function WorldScene:startTransition(enteringFrom)
    Fader:start(0, self.transitionLength)
    self.transition = self.transitionLength
    self.enteringFrom = enteringFrom
end

-- returns both a random nav point and the size of the set we chose from
function WorldScene:randNavPoint()
    local count = #self.navPoints
    return self.navPoints[love.math.random(count)], count
end

function WorldScene:playerPosition()
    return self.player:bodyPosition()
end

-- returns absolute total distance, then the independent distances
-- eg, given 60,50 and player=100,100 we'll get back 64.03,-40,-50
function WorldScene:distFromPlayer(x, y)
    local px, py = self:playerPosition()
    local dx, dy = (x - px), (y - py)
    return math.sqrt((dx ^ 2) + (dy ^ 2)), dx, dy
end
