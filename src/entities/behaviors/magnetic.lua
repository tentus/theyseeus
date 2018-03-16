Magnetic = Class{
    radius = 0,     -- we'll need to offset our own girth when determining if we're in range
    magnetSpeed = 8,
}

function Magnetic:update(dt)
    local dist, dx, dy = WorldScene:distFromPlayer(self.x, self.y)
    if dist - self.radius <= WorldScene.player.magnetRange then
        local speed = self.magnetSpeed * dt
        self.x = self.x - (dx * speed)
        self.y = self.y - (dy * speed)
    end
end
