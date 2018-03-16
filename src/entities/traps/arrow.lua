Arrow = Class{
    __includes = {Killable},
    classname = 'Arrow',
    image = love.graphics.newImage('assets/sprites/traps/arrow-trap.png'),
    --quad = Quad,

    width = 32,
    height = 64,

    speed = 800,

    rotation = 0,

    lifespan = 8,
    death_audio = false,
}

function Arrow:init(world, x, y, rotation)
    self:createBody(world, x, y)

    local offset = math.rad(90)
    self.body:setAngle(rotation)
    self.body:setLinearVelocity(
       math.cos(rotation + offset) * self.speed,
       math.sin(rotation + offset) * self.speed
    )

    local ix, iy = self.image:getDimensions()
    self.quad = love.graphics.newQuad(0, 16, 64, 128, ix, iy)

    AudioManager:play('assets/audio/arrow.ogg')
end

function Arrow:update(dt)
    self.lifespan = self.lifespan - dt

    if self.lifespan <= 0 then
        self:kill()
    end
end

function Arrow:draw()
    local x, y = self.body:getPosition()
    love.graphics.setColor(255, 255, 255, math.min(self.lifespan, 2) * 128)
    love.graphics.draw(self.image, self.quad, x, y, self.body:getAngle(), 0.5, 0.5, self.width, self.height)
    love.graphics.setColor(255, 255, 255)
end

function Arrow:createBody(world, x, y)
    self.body = love.physics.newBody(world, x, y, "dynamic")

    -- note that the body is significantly skinnier than the image
    self.shape   = love.physics.newRectangleShape(4, 48)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
end

function Arrow:beginContact(other)
    if other.damage then
        other:damage()
        self.lifespan = math.min(self.lifespan, 1)
    end
end
