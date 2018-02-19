-- no autoloader in lua :'(
require 'entities.sign'

Kid = Class{
    __includes = Sign,      -- sorry, kid
    classname = 'Kid',
    height = 128,
    image = love.graphics.newImage("assets/sprites/kid.png"),
}

function Kid:init(x, y, world, dialog)
    Sign.init(self, x, y, world, dialog)
end
