Minotaur = Class{
    radius = 63,
    image = love.graphics.newImage("assets/sprites/minotaur.png"),
    offsets = {}
}

function Minotaur:init(x, y, world)
    -- set offsets for image drawing, since it won't change
    self.offsets.x = self.image:getWidth() / 2
    self.offsets.y = self.image:getHeight() / 2

    -- set up physics body
    self.body = love.physics.newBody(world, x, y, "dynamic")
    self.body:setLinearDamping(10)

    self.shape   = love.physics.newCircleShape(self.radius)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Minotaur:draw()
    local x, y = self.body:getPosition()
    love.graphics.draw(self.image, x - self.offsets.x, y - self.offsets.y)
end
