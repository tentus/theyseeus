-- make some local state consts
local LOADED, TRIPPED, SPRUNG = 'loaded', 'tripped', 'sprung'

SpikeTrap = Class{
    classname = 'SpikeTrap',
    image = love.graphics.newImage('assets/sprites/traps/spikes.png'),
    quads = {},
    width = 64,
    height = 64,
    state = LOADED,
    delay = 1,
}

function SpikeTrap:init(world, x, y)
    self.x = x
    self.y = y
    self:createBody(world)

    local ix, iy = self.image:getDimensions()
    self.quads[LOADED]  = love.graphics.newQuad(0, 0,           self.width, self.height, ix, iy)
    self.quads[TRIPPED] = love.graphics.newQuad(self.width, 0,  self.width, self.height, ix, iy)
    self.quads[SPRUNG]  = love.graphics.newQuad(0, self.height, self.width, self.height, ix, iy)
end

function SpikeTrap:update(dt)
    if self.state == TRIPPED then
        self.delay = self.delay - dt
        if self.delay < 0 then
            self:changeState(SPRUNG)
        end
    end
end

function SpikeTrap:draw()
    love.graphics.draw(self.image, self.quads[self.state], self.x, self.y, 0, 1, 1, self.width / 2, self.height / 2)
end

function SpikeTrap:changeState(state)
    self.state = state
    AudioManager:play('assets/audio/spike_trap_' .. state .. '.ogg')
end

function SpikeTrap:createBody(world)
    self.body = love.physics.newBody(world, self.x, self.y, "static")

    self.shape   = love.physics.newCircleShape(self.width / 2)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setSensor(true)
    self.fixture:setUserData(self)
end

function SpikeTrap:beginContact(other)
    if self.state == LOADED then
        self:changeState(TRIPPED)
    elseif self.state == SPRUNG and other.damage then
        other:damage()
    end
end
