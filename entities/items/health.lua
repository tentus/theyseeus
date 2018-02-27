Health = Class{
    __includes = {Killable, Sensable},
    classname = 'Health',
    radius = 16,
    sprite = Sprite("assets/sprites/hud/health_icon.png"),
    death_audio = "assets/audio/collect.ogg",
}

function Health:init(x, y)
    Sensable.init(self, x, y)
end

function Health:draw()
    self.sprite:draw(self.x, self.y)
end

function Health:playerSensed(player)
    player:heal()
    self:kill()
    Logger:add("Health Collected")
end
