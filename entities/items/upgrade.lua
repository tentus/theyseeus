Upgrade = Class{
    __includes = {Killable, Sensable},
    classname = 'Upgrade',
    sprite = Sprite("assets/sprites/items/upgrade.png"),
    glow = GlowEffect(),
    death_audio = "assets/audio/collect.ogg",
}

function Upgrade:init(x, y)
    Sensable.init(self, x, y)
end

function Upgrade:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Upgrade:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Upgrade:playerSensed(player)
    InventoryManager:collect(self.classname)
    player:incrementHealth()
    self:kill()
end
