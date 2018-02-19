-- intended to a child of other entities
GlowEffect = Class{
    rotation = 0,
    spinrate = 1,
    image = love.graphics.newImage("assets/sprites/glow.png"),
}

function GlowEffect:init()
    -- set offsets for image drawing, since it won't change
    self.x = self.image:getWidth() / 2
    self.y = self.image:getHeight() / 2
end

function GlowEffect:draw(x, y)
    local scale = math.abs((self.rotation % 1) - 0.5) * 0.2 + 0.8
    love.graphics.draw(
        self.image,
        x, y,
        self.rotation,
        scale, scale,
        self.x, self.y
    )
end

function GlowEffect:update(dt)
    self.rotation = self.rotation + (dt * self.spinrate)
end
