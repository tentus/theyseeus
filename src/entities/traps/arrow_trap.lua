ArrowTrap = Class{
    __includes = {Physical},
    classname = 'ArrowTrap',
    image = love.graphics.newImage('assets/sprites/traps/arrow-trap.png'),
    quads = {},

    bodyType = 'static',
    radius = 16,

    rotation = 0,
    rotationSpeed = 30,     -- in degrees per second

    reload = 0,
    reloadDuration = 3,

    range = 1024,   -- how far we can see. don't want to be firing at the player if they can't see us
    deadzone = 24,  -- needs to be larger than the radius, so we don't shoot ourselves
}

function ArrowTrap:init(world, x, y, name)
    self.x = x
    self.y = y
    self:createBody(world, x, y)

    if name == 'Locked' then
        self.rotationSpeed = 0  -- todo: this could be a lot more flexible with some minor tweaks
    end

    local ix, iy = self.image:getDimensions()
    self.quads = {
        arrow = love.graphics.newQuad(0, 0, 64, 128, ix, iy),
        base  = love.graphics.newQuad(64, 0, 64, 128, ix, iy),
        skull = love.graphics.newQuad(128, 0, 128, 128, ix, iy),
    }
end

function ArrowTrap:update(dt)
    self.rotation = self.rotation + math.rad(dt * self.rotationSpeed)

    if self.reload > 0 then
        self.reload = self.reload - dt
    else
        local x1, y1, x2, y2 = self:rayPoints()
        local closestFixture
        local lowestFraction = 1
        WorldScene.physics:rayCast(x1, y1, x2, y2, function(fixture, x, y, xn, yn, fraction)
            -- rays do not hit in order, so to find the closest hit we have to keep track of the fraction
            if fraction < lowestFraction then
                lowestFraction = fraction
                closestFixture = fixture
            end
            return 1
        end)

        if closestFixture and closestFixture.getUserData and closestFixture:getUserData().damage then
            WorldScene:addEnt('Misc', Arrow(WorldScene.physics, x1, y1, self.rotation))

            self.reload = self.reloadDuration
        end
    end
end

function ArrowTrap:draw()
    local function draw(quad, r, ox, oy)
        love.graphics.draw(self.image, quad, self.x, self.y, r, 0.5, 0.5, ox, oy)
    end
    draw(self.quads.base, 0, 32, 64)
    draw(self.quads.skull, self.rotation, 64, 64)
    if self.reload <= 0 then
        draw(self.quads.arrow, self.rotation, 32, 64)
    end

    if self.debug then
        love.graphics.line(self:rayPoints())
    end
end

function ArrowTrap:rayPoints()
    local offset = math.rad(90)
    return self.x + math.cos(self.rotation + offset) * self.deadzone,
           self.y + math.sin(self.rotation + offset) * self.deadzone,
           self.x + math.cos(self.rotation + offset) * self.range,
           self.y + math.sin(self.rotation + offset) * self.range
end
