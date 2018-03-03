Sign = Class{
    __includes = {Interactable},
    classname = 'Sign',
    dialog = '',

    -- our body the same dimensions as a normal tile
    width = 64,
    height = 64,
    sprite = SpriteComponent("assets/sprites/sign.png"),
}

function Sign:init(world, x, y, dialog)
    self.body = love.physics.newBody(world, x, y, "static")
    self.shape   = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)

    self.dialog = dialog
end

function Sign:draw()
    local x, y = self.body:getPosition()
    self.sprite:draw(x, y)
end

function Sign:playerContact(other)
    Gamestate.push(DialogScene, self.dialog)
    Logger:add("Signs Read")
end
