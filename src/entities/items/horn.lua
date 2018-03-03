Horn = Class{
    __includes = {Killable, Sensable},
    classname = 'Horn',
    sprite = SpriteComponent('assets/sprites/items/horn.png'),
    death_audio = 'assets/audio/collect.ogg',
}

function Horn:init(x, y)
    Sensable.init(self, x, y)
end

function Horn:draw()
    self.sprite:draw(self.x, self.y)
end

function Horn:playerSensed()
    WorldScene:addEnt('Pickups', RippleEffect(self.x, self.y, {255, 255, 128}))
    local total = InventoryManager:collect(self.classname)
    self:kill()

    if total == 1 then
        Gamestate.push(DialogScene, 'AboutHorn')
    end
end