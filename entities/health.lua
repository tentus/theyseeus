Health = Class{
    __includes = {Interactable, Killable, Sensable},
    classname = 'Health',
    radius = 16,
    sprite = {
        image = love.graphics.newImage("assets/sprites/health_icon.png"),
    },
    death_audio = love.audio.newSource("assets/audio/collect.ogg", "static"),
}

function Health:init(x, y, world)
    -- set offsets for image drawing, since it won't change
    self.sprite.x = self.sprite.image:getWidth() / 2
    self.sprite.y = self.sprite.image:getHeight() / 2

    self:createBody(world, x, y)
end

function Health:draw()
    local x, y = self.body:getPosition()
    love.graphics.draw(self.sprite.image, x - self.sprite.x, y - self.sprite.y)
end

function Health:playerContact(player)
    player:heal()
    self:kill()
end
