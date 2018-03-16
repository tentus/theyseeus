Upgrade = Class{
    __includes = {BaseItem, Explicable, Rippleable},
    classname = 'Upgrade',
    sprite = SpriteComponent('assets/sprites/items/upgrade.png'),
    glow = GlowComponent(),
    explanationDialog = 'AboutUpgrades',
    rippleColor = {128, 255, 128},
}

function Upgrade:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Upgrade:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Upgrade:playerSensed(player)
    player:incrementHealth()
    self:addRipple()
    InventoryManager:collect(self.classname)
    self:explain()
    self:kill()
end
