-- intended to a child of other entities
ShadowEffect = Class{
    image = love.graphics.newImage("assets/sprites/shadow.png"),
    xScale = 1,
    yScale = 0.3,
}

function ShadowEffect:init(x, y)
    -- it's worth setting the position for this one manually, it can take some fussing
    self.x = x
    self.y = y
end

function ShadowEffect:draw(x, y)
    love.graphics.draw(
        self.image,
        x - self.x, y - self.y,
        0,
        self.xScale, self.yScale
    )
end
