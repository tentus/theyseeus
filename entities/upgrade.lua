Upgrade = Class{
    __includes = {Interactable, Killable, Sensable},
    classname = 'Upgrade',
    radius = 32,
    sprite = Sprite("assets/sprites/upgrade.png"),
    glow = GlowEffect(),
    death_audio = "assets/audio/collect.ogg",
}

function Upgrade:init(world, x, y)
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
