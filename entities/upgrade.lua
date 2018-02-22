Upgrade = Class{
    __includes = {Killable, Sensable},
    classname = 'Upgrade',
    sprite = Sprite("assets/sprites/upgrade.png"),
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
    InventoryManager:collectUpgrade(RegionManager:coords())
    player:incrementHealth()
    self:kill()
    Logger:add("Upgrades Collected")
end
