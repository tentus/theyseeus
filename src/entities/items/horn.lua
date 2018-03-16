Horn = Class{
    __includes = {BaseItem, Explicable, RippleEffect},
    classname = 'Horn',
    sprite = SpriteComponent('assets/sprites/items/horn.png'),
    explanationDialog = 'AboutHorn',
    rippleColor = {255, 255, 128},
}

function Horn:playerSensed()
    self:addRipple()
    InventoryManager:collect(self.classname)
    self:explain()
    self:kill()
end
