Coin = Class{
    __includes = {Killable, Sensable},
    classname = 'Coin',
    radius = 16,
    sprite = SpriteComponent("assets/sprites/items/coin.png"),
    death_audio = "assets/audio/collect.ogg",
}

function Coin:init(x, y)
    Sensable.init(self, x, y)
end

function Coin:draw()
    self.sprite:draw(self.x, self.y)
end

function Coin:playerSensed()
    InventoryManager:collect(self.classname)
    self:kill()
end
