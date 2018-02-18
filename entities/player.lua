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
    healthIcon = love.graphics.newImage("assets/sprites/health_icon.png"),
    damageIcon = love.graphics.newImage("assets/sprites/damage_icon.png"),
}

function Player:update(dt)
    Damagable.update(self, dt)

    local kd = love.keyboard.isDown
    local x, y = 0, 0

    -- note the separate ifs: if you press opposing keys they'll cancel out
    if kd("a") or kd("left")  then x = x - 1 end
    if kd("d") or kd("right") then x = x + 1 end
    if kd("w") or kd("up")    then y = y - 1 end
    if kd("s") or kd("down")  then y = y + 1 end

    if (x ~= 0 or y ~= 0) and kd("space") then
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

function Player:drawHUD()
    for i=1, self.maxHealth do
        local icon = ((self.health < i) and self.damageIcon or self.healthIcon)
        love.graphics.draw(icon, (i * 40) - 32, 8)
    end
end

function Player:kill()
    self.health = self.maxHealth
    RegionManager:warpHome()
    WorldScene:loadRegion("Start")
end
