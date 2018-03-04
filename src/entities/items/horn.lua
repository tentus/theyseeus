Horn = Class{
    __includes = {Killable, RippleEffect, Sensable},
    classname = 'Horn',
    sprite = SpriteComponent('assets/sprites/items/horn.png'),
    death_audio = 'assets/audio/collect.ogg',
    rippleColor = {255, 255, 128},
}

function Horn:init(x, y)
    Sensable.init(self, x, y)
end

function Horn:draw()
    self.sprite:draw(self.x, self.y)
end

function Horn:playerSensed()
    self:addRipple()
    local total = InventoryManager:collect(self.classname)
    self:kill()

    if total == 1 then
        Gamestate.push(DialogScene, 'AboutHorn')
    end
end
