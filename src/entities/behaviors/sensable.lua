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
    if WorldScene:distFromPlayer(self.x, self.y) <= (self.radius + player.radius) then
        self:playerSensed(player)
    end
end

function Sensable:playerSensed(player)
    -- interface placeholder
end
