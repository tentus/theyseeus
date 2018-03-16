Horn = Class{
    __includes = {BaseItem, RippleEffect},
    classname = 'Horn',
    sprite = SpriteComponent('assets/sprites/items/horn.png'),
    rippleColor = {255, 255, 128},
}

function Horn:playerSensed()
    self:addRipple()
    local total = InventoryManager:collect(self.classname)
    self:kill()

    if total == 1 then
        Gamestate.push(DialogScene, 'AboutHorn')
    end
end
