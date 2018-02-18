WorldScene = {
    npcs = {},
    pickups = {},
    showInventory = false,
    showMap = false,
    -- map = sti map,
    -- physics = physics world,
    -- player = Player instance,
}

function WorldScene:init()
    -- populate our region arrangement from a whitelist of maps
    RegionManager:init()

    love.physics.setMeter(64)

    self:loadRegion("North")
end

function WorldScene:update(dt)
    DaylightManager:update(dt)
    self.physics:update(dt)
    self.player:update(dt)
    self.map:update(dt)

    for _, npc in pairs(self.npcs) do
        npc:update(dt)
    end

    for k, pickup in pairs(self.pickups) do
        if pickup.dead then
            table.remove(self.pickups, k)
        else
            pickup:update(dt)
        end
    end

    self:changeRegion()
end

function WorldScene:draw()
    love.graphics.push()

    -- determine how much we need to translate around to see the player
    local width, height = love.window.getMode()
    local tx = (width / 2) - self.player.body:getX()
    local ty = (height / 2) - self.player.body:getY()
    love.graphics.translate(tx, ty)

    -- Draw map
    self.map:draw(tx, ty)

    for i=1, #self.npcs do
        self.npcs[i]:draw()
    end

    for _, pickup in pairs(self.pickups) do
        pickup:draw()
    end

    -- Draw "player"
    self.player:draw()

    love.graphics.pop()

    if self.showInventory then
        InventoryManager:draw()
    end

    if self.showMap then
        RegionManager:draw()
    end

    DaylightManager:draw()
    Fader:draw()
    FPS:draw()
end

function WorldScene:keypressed(key)
    if key == "escape" or key == "backspace" then
        Gamestate.switch(MenuScene)
    elseif key == "i" then
        self.showInventory = not self.showInventory
    elseif key == "p" then
        self.showMap = not self.showMap
    end
end

function WorldScene:enter()
    self.map:resize(love.window.getMode())
end

function WorldScene:resize(w, h)
    self.map:resize(w, h)
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
    self.map = sti("maps/" .. RegionManager:current() .. ".lua", {"box2d"})

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

    self:spawnEntities()

    -- create our player instance (we'll move them after the map loads)
    local spawn = self:findSpawn(enteringFrom)
    if not self.player then
        self.player = Player(spawn.x, spawn.y, self.physics)
    else
        self.player:createBody(self.physics, spawn.x, spawn.y)
    end

    -- calculate what can be walked on and rig up a pathfinder
    self.pathManager = PathManager(self.map)
end

function WorldScene:spawnEntities()
    self.npcs = {}
    self.pickups = {}
    for _, object in pairs(self.map.objects) do
        if object.type == "NPC" then
            table.insert(self.npcs, NPC(object.x, object.y, self.physics))
        elseif object.type == "Yarn" then
            if not InventoryManager:hasYarn(RegionManager:coords()) then
                table.insert(self.pickups, Yarn(object.x, object.y, self.physics))
            end
        end
    end
end

function WorldScene:changeRegion()
    local buffer = 512
    local x, y = self.player.body:getPosition()

    if x < buffer then
        RegionManager:moveHorizontal(-1)
        self:loadRegion("East")
    elseif x > (self.map.width * self.map.tilewidth) - buffer then
        RegionManager:moveHorizontal(1)
        self:loadRegion("West")
    end

    if y < buffer then
        RegionManager:moveVertical(-1)
        self:loadRegion("South")
    elseif y > (self.map.height * self.map.tileheight) - buffer then
        RegionManager:moveVertical(1)
        self:loadRegion("North")
    end
end
