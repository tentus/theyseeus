Physical = Class{
    -- body    = Body,
    -- shape   = Shape,
    -- fixture = Fixture,
    bodyType = 'dynamic',
    isSensor = false,
}

function Physical:createBody(world, x, y)
    self.body    = love.physics.newBody(world, x, y, self.bodyType)
    self.shape   = self:makeShape()
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setSensor(self.isSensor)
    self.fixture:setUserData(self)
end

-- separated so it can be overridden for rectangles
function Physical:makeShape()
    return love.physics.newCircleShape(self.radius)
end

function Physical:bodyPosition()
    return self.body:getPosition()
end
