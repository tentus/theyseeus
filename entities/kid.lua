-- no autoloader in lua :'(
require 'entities.sign'

Kid = Class{
    __includes = Sign,      -- sorry, kid
    classname = 'Kid',
    height = 96,
    shadow = ShadowEffect(32, -32),
    sprite = Sprite("assets/sprites/kid.png"),
}

function Kid:init(x, y, world, dialog)
    Sign.init(self, x, y, world, dialog)
end

function Kid:draw()
    local x, y = self.body:getPosition()
    self.shadow:draw(x, y)
    self.sprite:draw(x, y)
end
