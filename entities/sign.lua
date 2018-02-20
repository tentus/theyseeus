Sign = Class{
    __includes = {Interactable},
    classname = 'Sign',
    dialog = "",

    -- our body the same dimensions as a normal tile
    width = 64,
    height = 64,
    sprite = Sprite("assets/sprites/sign.png"),
}

function Sign:init(x, y, world, dialog)
    -- the pins in Tiled look higher than they are, so we push ourselves up a little
    self.body = love.physics.newBody(world, x, y - 16, "static")
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
end
