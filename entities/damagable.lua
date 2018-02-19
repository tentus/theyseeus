Damagable = Class{
    health = 1,
    invincibility = {
        remaining = 0,
        length = 1,
    },
    damage_audio = {
        love.audio.newSource("assets/audio/damage1.ogg", "static"),
        love.audio.newSource("assets/audio/damage2.ogg", "static"),
        love.audio.newSource("assets/audio/damage3.ogg", "static"),
    }
}

function Damagable:update(dt)
    self.invincibility.remaining = self.invincibility.remaining - dt
end

function Damagable:invincible()
    return self.invincibility.remaining > 0
end

function Damagable:damage()
    if self:invincible() then return end

    self.health = self.health - 1

    if self.kill and self.health < 1 then
        self:kill()
    else
        self.damage_audio[math.random(#self.damage_audio)]:play()
        self.invincibility.remaining = self.invincibility.length
    end
end
