FreezeEffect = Class{
    __includes = {Killable},
    classname = 'Freeze',
    image = love.graphics.newImage('assets/sprites/effects/cloud.png'),
}

function FreezeEffect:init(x, y)
    local p = love.graphics.newParticleSystem(self.image, 2000)
    p:setPosition(x, y)
    p:setEmissionRate(2000)
    p:setEmitterLifetime(0.1)
    p:setInsertMode("bottom")
    p:setParticleLifetime(5)
    p:setSpin(0, -10)
    p:setSpeed(1500)
    p:setSpread(6.3)
    p:setColors(
        128, 192, 255, 255,
        255, 255, 255, 0
    )
    self.particles = p
end

function FreezeEffect:draw()
    love.graphics.draw(self.particles)
end

function FreezeEffect:update(dt)
    self.particles:update(dt)
    if self.particles:getCount() == 0 then
        self:kill()
    end
end
