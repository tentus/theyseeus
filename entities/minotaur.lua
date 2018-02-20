Minotaur = Class{
    classname = 'Minotaur',
    radius = 31,
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
    currentAnim = "walkDown",
    anims = {},
}

function Minotaur:init(world, x, y)
    local gridsize = 128
    -- set offsets for image drawing, since it won't change
    self.offsets.x = gridsize * 0.5
    self.offsets.y = gridsize * 0.75

    local grid = anim8.newGrid(gridsize, gridsize, self.image:getWidth(), self.image:getHeight())
    self.anims = {
        walkUp    = anim8.newAnimation(grid(1,1, 2,1), .2),
        walkRight = anim8.newAnimation(grid(1,2, 2,2), .2),
        walkDown  = anim8.newAnimation(grid(1,3, 2,3, 3,3, 4,3), .2),
    }

    -- choose some attributes (todo: this doesn't seem as random as it should be?)
    for k, v in pairs(self.attributes.possible) do
        self.attributes.chosen[k] = v[love.math.random(#v)]
    end

    -- set up physics body
    self:createBody(world, x, y)

    -- set the shadow here, so it is inherited properly
    self.shadow = ShadowEffect(32, -20)
end

function Minotaur:update(dt)
    local threshold = 2
    local xVel, yVel = self.body:getLinearVelocity()
    local absX, absY = math.abs(xVel), math.abs(yVel)

    -- only animate if we're moving
    if absX > threshold or absY > threshold then
        if absX > threshold and absX > absY then
            self.currentAnim = "walkRight"
            self.anims[self.currentAnim].flippedH = (xVel < 0)
        elseif yVel > threshold then
            self.currentAnim = "walkDown"
        elseif yVel < -threshold then
            self.currentAnim = "walkUp"
        end
        self.anims[self.currentAnim]:update(dt)
    end
end

function Minotaur:draw()
    local x, y = self.body:getPosition()
    self.shadow:draw(x, y)
    self.anims[self.currentAnim]:draw(self.image, x - self.offsets.x, y - self.offsets.y)

    -- todo: overlay attributes visually
    --[[
    local label = "\n"
    for k, v in pairs(self.attributes.chosen) do
        label = label .. "\n" .. k .. ": " .. v
    end
    love.graphics.printf(label, x - self.offsets.x, y - self.offsets.y, self.image:getWidth(), "center")
    ]]
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

function Minotaur:getTargetPosition()
    return self.body:getPosition()
end
