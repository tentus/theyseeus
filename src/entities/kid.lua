Kid = Class{
    __includes = {Interactable, Physical},
    classname = 'Kid',

    bodyType = 'static',

    -- tile and a half in size
    width = 64,
    height = 64,

    shadow = ShadowComponent(32, -96),
    sprite = SpriteComponent('assets/sprites/kid.png'),
}

function Kid:init(world, x, y)
    self:createBody(world, x, y)
end

function Kid:draw()
    local x, y = self:bodyPosition()
    self.shadow:draw(x, y)
    self.sprite:draw(x, y)
end

function Kid:makeShape()
    return love.physics.newRectangleShape(self.width, self.height)
end

function Kid:playerContact()
    local dialog = (InventoryManager:total(Yarn.classname) >= YARN_REQUIREMENT) and 'Victory' or 'Quest'
    Gamestate.push(DialogScene, dialog)
    Logger:add('Conversations')
end
