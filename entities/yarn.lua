Yarn = Class{
    __includes = {Killable, Sensable},
    classname = 'Yarn',
    sprite = Sprite("assets/sprites/yarn.png"),
    glow = GlowEffect(),
    death_audio = "assets/audio/collect.ogg",
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
    InventoryManager:collect(self.classname, RegionManager:coords())
    self:kill()
end
