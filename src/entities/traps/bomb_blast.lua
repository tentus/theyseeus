BombBlast = Class{
    __includes = {Killable, Physical},
    classname = 'BombBlast',

    image = love.graphics.newImage('assets/sprites/effects/cloud.png'),

    isSensor = true,
    radius = 256,
}

function BombBlast:init(world, x, y)
    self:createBody(world, x, y)

    local p = love.graphics.newParticleSystem(self.image)
    p:setPosition(x, y)
    p:setEmissionRate(1000)
    p:setEmitterLifetime(0.3)
    p:setInsertMode("bottom")
    p:setParticleLifetime(0.25)
    p:setSpeed(950, 1000)       -- very roughly matches the size of the body
    p:setSpin(0, -10)
    p:setSpread(6.3)
    p:setColors(
        1, 0.25, 0.25, 1,
        0.5, 0.25, 0, 0
    )
    self.particles = p

    AudioManager:play('assets/audio/muffled_explosion.ogg')
end

function BombBlast:update(dt)
    self.particles:update(dt)
    if self.particles:getCount() == 0 then
        self:kill()
    end
end

function BombBlast:draw()
    love.graphics.draw(self.particles)
end

function BombBlast:beginContact(other)
    if other.damage then
        other:damage()
    end
end
