Health = Class{
    __includes = {Interactable, Killable, Sensable},
    classname = 'Health',
    radius = 16,
    sprite = Sprite("assets/sprites/health_icon.png"),
    death_audio = "assets/audio/collect.ogg",
}

function Health:init(world, x, y)
    self:createBody(world, x, y)
end

function Health:draw()
    local x, y = self.body:getPosition()
    self.sprite:draw(x, y)
end

function Health:playerContact(player)
    player:heal()
    self:kill()
end
