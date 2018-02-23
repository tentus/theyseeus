Player = Class{
    __includes = {Minotaur, Damagable, Killable},
    classname = 'Player',
    defaultForce = 5000,
    currentForce = 5000,
    maxForce = 25000,
    acceleration = 9000,

    -- override default health
    health = 3,
    maxHealth = 3,
}

function Player:update(dt)
    Damagable.update(self, dt)
    Minotaur.update(self, dt)

    local x, y = Bindings:get('move')

    if (x ~= 0 or y ~= 0) and Bindings:down('action') then
        self.currentForce = math.min((self.currentForce + (dt * self.acceleration)), self.maxForce)
    else
        -- you loose your accumulated boost the moment you let off the gas
        -- this does not equate to losing your speed, since we're using applied forces
        self.currentForce = self.defaultForce
    end

    self.body:applyForce(x * self.currentForce, y * self.currentForce)
end

function Player:draw()
    if self:invincible() then
        love.graphics.setColor(255, 0, 0)
        Minotaur.draw(self)
        love.graphics.setColor(255, 255, 255)
    else
        Minotaur.draw(self)
    end
end

function Player:incrementHealth()
    self.maxHealth = self.maxHealth + 1
    self.health = self.maxHealth
end

function Player:heal()
    self.health = math.min(self.health + 1, self.maxHealth)
end

function Player:damage()
    Damagable.damage(self)
    Logger:add("Damage taken")
end

function Player:kill()
    Gamestate.push(DeathScene)
    Logger:add("Deaths")
end
