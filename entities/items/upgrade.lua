Upgrade = Class{
    __includes = {Killable, Sensable},
    classname = 'Upgrade',
    sprite = SpriteComponent('assets/sprites/items/upgrade.png'),
    glow = GlowComponent(),
    death_audio = 'assets/audio/collect.ogg',
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
    WorldScene:addEnt("Pickups", RippleEffect(self.x, self.y, {128, 255, 128}))
    InventoryManager:collect(self.classname)
    player:incrementHealth()
    self:kill()
end
