Yarn = Class{
    __includes = {BaseItem, Rippleable},
    classname = 'Yarn',
    sprite = SpriteComponent('assets/sprites/items/yarn.png'),
    glow = GlowComponent(),
    rippleColor = {128, 128, 255},
}

function Yarn:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Yarn:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Yarn:playerSensed(player)
    self:addRipple()
    InventoryManager:collect(self.classname)
    self:kill()
end
