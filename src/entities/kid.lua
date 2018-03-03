-- no autoloader in lua :'(
require 'src.entities.sign'

Kid = Class{
    __includes = Sign,      -- sorry, kid
    classname = 'Kid',
    height = 96,
    shadow = ShadowComponent(32, -96),
    sprite = SpriteComponent('assets/sprites/kid.png'),
}

function Kid:init(world, x, y, dialog)
    Sign.init(self, world, x, y, dialog)
end

function Kid:draw()
    local x, y = self.body:getPosition()
    self.shadow:draw(x, y)
    self.sprite:draw(x, y)
end
