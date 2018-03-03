Yarn = Class{
    __includes = {Killable, Sensable},
    classname = 'Yarn',
    sprite = SpriteComponent('assets/sprites/items/yarn.png'),
    glow = GlowComponent(),
    death_audio = 'assets/audio/collect.ogg',
}

function Yarn:init(x, y)
    Sensable.init(self, x, y)
end

function Yarn:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Yarn:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Yarn:playerSensed(player)
    WorldScene:addEnt("Pickups", RippleEffect(self.x, self.y, {128, 128, 255}))
    InventoryManager:collect(self.classname)
    self:kill()
end
