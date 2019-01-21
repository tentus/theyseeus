-- intended to a child of other entities
ExplosionEffect = Class{
    __includes = {Killable},
    classname = 'Explosion',
    image = love.graphics.newImage('assets/sprites/effects/cloud.png'),
}

function ExplosionEffect:init(x, y)
    local p = love.graphics.newParticleSystem(self.image)
    p:setPosition(x, y)
    p:setEmissionRate(500)
    p:setEmitterLifetime(0.2)
    p:setInsertMode("bottom")
    p:setParticleLifetime(2)
    p:setRadialAcceleration(-400)
    p:setSpin(0, -10)
    p:setSpeed(350, 375)
    p:setSpread(6.3)
    p:setColors(
        1, 0.5, 0.25, 1,
        0.5, 0, 0.125, 0
    )
    self.particles = p
end

function ExplosionEffect:draw()
    love.graphics.draw(self.particles)
end

function ExplosionEffect:update(dt)
    self.particles:update(dt)
    if self.particles:getCount() == 0 then
        self:kill()
    end
end
