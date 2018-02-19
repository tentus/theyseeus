Sign = Class{
    __includes = {Interactable},
    classname = 'Sign',
    dialog = "",

    -- our body the same dimensions as a normal tile
    size = 64,
    image = love.graphics.newImage("assets/sprites/sign.png"),
}

function Sign:init(x, y, world, dialog)
    -- the pins in Tiled look higher than they are, so we push ourselves up a little
    self.body = love.physics.newBody(world, x, y - 16, "static")
    self.shape   = love.physics.newRectangleShape(self.size, self.size)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)

    self.dialog = dialog
end

function Sign:draw()
    local x, y = self.body:getPosition()
    love.graphics.draw(self.image, x - (self.size / 2), y - (self.size / 2))
end

function Sign:playerContact(other)
    Gamestate.push(DialogScene, self.dialog)
end
