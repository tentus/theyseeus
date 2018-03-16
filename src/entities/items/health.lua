Health = Class{
    __includes = {BaseItem},
    classname = 'Health',
    radius = 16,
    sprite = SpriteComponent('assets/sprites/hud/health_icon.png'),
}

function Health:playerSensed(player)
    player:heal()
    self:kill()
    Logger:add('Health Collected')
end
