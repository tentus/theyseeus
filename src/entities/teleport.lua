Teleport = Class{
    __includes = {Sensable},
    classname = 'Teleport',
    sprite = SpriteComponent('assets/sprites/teleport.png'),
    pulse = 0,
    pulseRate = 2.5,
    destination = {},
}

function Teleport:init(x, y, dx, dy)
    Sensable.init(self, x, y)
    self.destination = {
        x = dx,
        y = dy,
    }
end

function Teleport:update(dt)
    Sensable.update(self, dt)
    self.pulse = self.pulse + (dt / self.pulseRate)
end

function Teleport:draw()
    local alpha = math.abs((self.pulse % 1) - 0.5) + 0.5
    love.graphics.setColor(1, 1, 1, alpha)
    self.sprite:draw(self.x, self.y)
    love.graphics.setColor(1, 1, 1)
end

function Teleport:playerSensed(player)
    player.body:setPosition(self.destination.x, self.destination.y)
end
