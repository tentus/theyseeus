Sign = Class{
    __includes = {Interactable, Physical},
    classname = 'Sign',
    dialog = '',

    bodyType = 'static',

    -- our body the same dimensions as a normal tile
    width = 64,
    height = 64,
    sprite = SpriteComponent('assets/sprites/sign.png'),

    -- prevent npcs from trying to path through us
    fillsGrid = true,
}

function Sign:init(world, x, y, dialog)
    self:createBody(world, x, y)

    self.dialog = dialog
end

function Sign:draw()
    local x, y = self:bodyPosition()
    self.sprite:draw(x, y)
end

function Sign:makeShape()
    return love.physics.newRectangleShape(self.width, self.height)
end

function Sign:playerContact()
    Gamestate.push(DialogScene, self.dialog)
    Logger:add('Signs Read')
end
