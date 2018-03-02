-- intended to a child of other entities
ShadowComponent = Class{
    image = love.graphics.newImage("assets/sprites/effects/shadow.png"),
    xScale = 1,
    yScale = 0.3,
}

function ShadowComponent:init(x, y)
    -- it's worth setting the position for this one manually, it can take some fussing
    self.x = x
    self.y = y
end

function ShadowComponent:draw(x, y)
    love.graphics.draw(
        self.image,
        x - self.x, y - self.y,
        0,
        self.xScale, self.yScale
    )
end
