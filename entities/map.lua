Map = Class{
    __includes = {Killable, Sensable},
    classname = 'Map',
    sprite = Sprite("assets/sprites/items/map.png"),
    glow = GlowEffect(),
    death_audio = "assets/audio/collect.ogg",
}

function Map:init(x, y)
    Sensable.init(self, x, y)
end

function Map:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Map:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Map:playerSensed(player)
    RegionManager.mapFound = true
    self:kill()
end
