BaseCollectible = Class{
    __includes = {Killable, Magnetic, Sensable, Explicable, Rippleable},
    classname = 'BaseCollectible',

    death_audio = 'assets/audio/update.ogg',

    x = 0,
    y = 0,

    -- sprite = SpriteComponent,
}

function BaseCollectible:init(x, y)
    self.glow = GlowComponent(),
    Sensable.init(self, x, y)
end

function BaseCollectible:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function BaseCollectible:update(dt)
    self.glow:update(dt)
    Magnetic.update(self, dt)
    Sensable.update(self, dt)
end

function BaseCollectible:playerSensed()
    self:addRipple()
    InventoryManager:collect(self.classname)
    self:explain()
    self:kill()
end
