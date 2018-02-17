WorldScene = {
    -- map = sti map,
    -- physics = physics world,
    -- player = Player instance
}

function WorldScene:init()
    -- Load map
    self.map = sti("maps/1.lua", { "box2d" })

    -- Prepare physics world
    love.physics.setMeter(64)
    self.physics = love.physics.newWorld(0, 0)
    self.map:box2d_init(self.physics)

    -- find the player and create them
    local spawn = self:findSpawn()
    self.player = Player(spawn.x, spawn.y, self.physics)
end

function WorldScene:update(dt)
    self.physics:update(dt)
    self.player:update(dt)
    self.map:update(dt)
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

    -- Draw "player"
    self.player:draw()

    love.graphics.pop()

    Fader:draw()
    FPS:draw()
end

function WorldScene:keypressed(key)
    if key == "escape" or key == "backspace" then
        Gamestate.switch(MenuScene)
    end
end

function WorldScene:enter()
    self.map:resize(love.window.getMode())
end

function WorldScene:resize(w, h)
    self.map:resize(w, h)
end

function WorldScene:findSpawn()
    for _, object in pairs(self.map.objects) do
        if object.name == "North" then
            return object
        end
    end
end
