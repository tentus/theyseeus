Minotaur = Class{
    radius = 63,
    image = love.graphics.newImage("assets/sprites/minotaur.png"),
    offsets = {},
    attributes = {
        possible = {
            eyes = {'red', 'green', 'blue', 'yellow'},
            horns = {'simple', 'severed', 'recurved', 'long'},
            tats = {'rings', 'zags', 'spirals'}
        },
        chosen = {},
    },
}

function Minotaur:init(x, y, world)
    -- set offsets for image drawing, since it won't change
    self.offsets.x = self.image:getWidth() / 2
    self.offsets.y = self.image:getHeight() / 2

    -- choose some attributes (todo: this doesn't seem as random as it should be?)
    for k, v in pairs(self.attributes.possible) do
        self.attributes.chosen[k] = v[math.random(#v)]
    end

    -- set up physics body
    self.body = love.physics.newBody(world, x, y, "dynamic")
    self.body:setLinearDamping(10)

    self.shape   = love.physics.newCircleShape(self.radius)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Minotaur:draw()
    local x, y = self.body:getPosition()
    love.graphics.draw(self.image, x - self.offsets.x, y - self.offsets.y)

    local label = "\n"
    for k, v in pairs(self.attributes.chosen) do
        label = label .. "\n" .. k .. ": " .. v
    end
    love.graphics.printf(label, x - self.offsets.x, y - self.offsets.y, self.image:getWidth(), "center")
end
