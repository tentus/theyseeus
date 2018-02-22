-- a shortcut for things that only can be sensed only by the player
Sensable = Class{
    radius = 32,
}

function Sensable:init(x, y)
    self.x = x
    self.y = y
end

function Sensable:update(dt)
    local player = WorldScene.player
    local x, y = player.body:getPosition()
    if math.sqrt((self.x - x) ^ 2 + (self.y - y) ^ 2) <= (self.radius + player.radius) then
        print(x, y)
        self:playerSensed(player)
    end
end

function Sensable:playerSensed(player)
    -- interface placeholder
end
