Damagable = Class{
    health = 1,
    invincibility = {
        remaining = 0,
        length = 1,
    },
    damage_audio = {
        "assets/audio/damage1.ogg",
        "assets/audio/damage2.ogg",
        "assets/audio/damage3.ogg",
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
        AudioManager:play(self.damage_audio[love.math.random(#self.damage_audio)])
        self.invincibility.remaining = self.invincibility.length
    end
end
