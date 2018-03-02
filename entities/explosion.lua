-- intended to a child of other entities
Explosion = Class{
    __includes = {Killable},
    classname = 'Explosion',
    death_audio = false,
    image = love.graphics.newImage("assets/sprites/effects/cloud.png"),
}

function Explosion:init(x, y)
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
        255, 128, 64, 255,
        128, 0, 32, 0
    )
    self.particles = p
end

function Explosion:draw()
    love.graphics.draw(self.particles)
end

function Explosion:update(dt)
    self.particles:update(dt)
    if self.particles:getCount() == 0 then
        Killable.kill(self)
    end
end
