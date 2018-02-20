Upgrade = Class{
    __includes = {Interactable, Killable, Sensable},
    classname = 'Upgrade',
    radius = 32,
    sprite = Sprite("assets/sprites/upgrade.png"),
    glow = GlowEffect(),
    death_audio = love.audio.newSource("assets/audio/collect.ogg", "static"),
}

function Upgrade:init(x, y, world)
    self:createBody(world, x, y)
end

function Upgrade:draw()
    local x, y = self.body:getPosition()
    self.glow:draw(x, y)
    self.sprite:draw(x, y)
end

function Upgrade:update(dt)
    self.glow:update(dt)
end

function Upgrade:playerContact(other)
    InventoryManager:collectUpgrade(RegionManager:coords())
    other:incrementHealth()
    self:kill()
end
