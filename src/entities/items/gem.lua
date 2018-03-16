Gem = Class{
    __includes = {BaseItem, Rippleable},
    classname = 'Gem',
    sprite = SpriteComponent('assets/sprites/items/gem.png'),
    glow = GlowComponent(),
    rippleColor = {128, 255, 255},
}

function Gem:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Gem:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Gem:playerSensed(player)
    self:addRipple()
    local total = InventoryManager:collect(self.classname)
    self:kill()

    if total == 1 then
        Gamestate.push(DialogScene, 'AboutGem')
    end
end
