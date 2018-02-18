-- no autoloader in lua :'(
require 'entities.minotaur'

Kid = Class{
    __includes = Minotaur,
    classname = 'Kid',
    dialog = "",
}

function Kid:init(x, y, world, dialog)
    Minotaur.init(self, x, y, world)
    self.body:setType("static")

    self.dialog = dialog
end

function Kid:beginContact()
    Gamestate.push(DialogScene, self.dialog)
end
