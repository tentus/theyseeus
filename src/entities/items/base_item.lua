BaseItem = Class{
    __includes = {Killable, Sensable},
    classname = 'BaseItem',

    death_audio = 'assets/audio/collect.ogg',

    x = 0,
    y = 0,

    -- sprite = SpriteComponent,
}

function BaseItem:init(x, y)
    Sensable.init(self, x, y)
end

-- update inherited from Sensable

function BaseItem:draw()
    self.sprite:draw(self.x, self.y)
end

function BaseItem:playerSensed()
    InventoryManager:collect(self.classname)
    self:kill()
end
