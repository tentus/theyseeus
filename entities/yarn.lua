Yarn = Class{
    __includes = {Interactable, Killable, Sensable},
    classname = 'Yarn',
    sprite = Sprite("assets/sprites/yarn.png"),
    glow = GlowEffect(),
    death_audio = "assets/audio/collect.ogg",
}

function Yarn:init(x, y, world)
    self:createBody(world, x, y)
end

function Yarn:draw()
    local x, y = self.body:getPosition()
    self.glow:draw(x, y)
    self.sprite:draw(x, y)
end

function Yarn:update(dt)
    self.glow:update(dt)
end

function Yarn:playerContact()
    InventoryManager:collectYarn(RegionManager:coords())
    self:kill()
end
