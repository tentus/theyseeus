-- a shortcut for things that have circular sensor bodies
Sensable = Class{
    radius = 32,
}

function Sensable:createBody(world, x, y)
    self.body = love.physics.newBody(world, x or 0, y or 0, "static")

    self.shape   = love.physics.newCircleShape(self.radius)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setSensor(true)
    self.fixture:setUserData(self)
end
