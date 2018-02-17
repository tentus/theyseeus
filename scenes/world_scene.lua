WorldScene = {
    npcs = {},
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
    self.physics:update(dt)
    self.player:update(dt)
    self.map:update(dt)

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

    -- Draw "player"
    self.player:draw()

    love.graphics.pop()

    if self.showMap then
        RegionManager:draw()
    end

    Fader:draw()
    FPS:draw()
end

function WorldScene:keypressed(key)
    if key == "escape" or key == "backspace" then
        Gamestate.switch(MenuScene)
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
    self.map:box2d_init(self.physics)

    self:spawnNPCs()

    -- create our player instance (we'll move them after the map loads)
    local spawn = self:findSpawn(enteringFrom)
    if not self.player then
        self.player = Player(spawn.x, spawn.y, self.physics)
    else
        self.player:createBody(self.physics, spawn.x, spawn.y)
    end
end

function WorldScene:spawnNPCs()
    self.npcs = {}
    for _, object in pairs(self.map.objects) do
        if object.type == "NPC" then
            table.insert(self.npcs, NPC(object.x, object.y, self.physics))
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
