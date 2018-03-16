Map = Class{
    __includes = {BaseItem, Rippleable},
    classname = 'Map',
    sprite = SpriteComponent('assets/sprites/items/map.png'),
    glow = GlowComponent(),
    rippleColor = {255, 128, 128},
}

function Map:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Map:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Map:playerSensed(player)
    self:addRipple()
    local total = InventoryManager:collect(self.classname)
    self:kill()

    if total == 1 then
        Gamestate.push(DialogScene, 'AboutMap')
    end
end
