Minotaur = Class{
    classname = 'Minotaur',
    radius = 31,
    image = love.graphics.newImage("assets/sprites/testAnim.png"),
    offsets = {},
    attributes = {
        possible = {
            eyes = {'red', 'green', 'blue', 'yellow'},
            horns = {'simple', 'severed', 'recurved', 'long'},
            tats = {'rings', 'zags', 'spirals'}
        },
        chosen = {},
    },
    animGrid,
    currentAnimation = idleAnimation,
    idleAnimation,
    walkDownAnimation,
    walkUpAnimation,
    walkRightAnimation,

}

function Minotaur:update(dt)
    if self.currentAnimation == nil then self.currentAnimation = self.idleAnimation end


    self.currentAnimation:update(dt)
end

function Minotaur:init(x, y, world)
    -- set offsets for image drawing, since it won't change
    self.offsets.x = self.image:getWidth()/3 * 0.5
    self.offsets.y = self.image:getHeight() * 0.75

    self.animGrid = anim8.newGrid(64,128, self.image:getWidth(), self.image:getHeight())
    self.idleAnimation = anim8.newAnimation(self.animGrid(2,1), .5)
    self.walkDownAnimation = anim8.newAnimation(self.animGrid(1,1, 3,1), .2)

    self.currentAnimation = idleAnimation

    -- choose some attributes (todo: this doesn't seem as random as it should be?)
    for k, v in pairs(self.attributes.possible) do
        self.attributes.chosen[k] = v[math.random(#v)]
    end

    -- set up physics body
    self:createBody(world, x, y)
end

function Minotaur:draw()
    if self.currentAnimation == nil then self.currentAnimation = self.idleAnimation end
    local x, y = self.body:getPosition()
    self.currentAnimation:draw(self.image, x - self.offsets.x, y - self.offsets.y)

    local label = "\n"
    for k, v in pairs(self.attributes.chosen) do
        label = label .. "\n" .. k .. ": " .. v
    end
    love.graphics.printf(label, x - self.offsets.x, y - self.offsets.y, self.image:getWidth(), "center")
end

function Minotaur:createBody(world, x, y)
    self.body = love.physics.newBody(world, x or 0, y or 0, "dynamic")
    self.body:setLinearDamping(10)

    self.shape   = love.physics.newCircleShape(self.radius)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)

    -- each shape affixed will affect the mass, so we have to reset it each time
    self.body:setMass(1)
end
