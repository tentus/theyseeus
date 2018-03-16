-- make some local state consts
local LOADED, TRIPPED, SPRUNG = 'loaded', 'tripped', 'sprung'

SpikeTrap = Class{
    __includes = {Physical},
    classname = 'SpikeTrap',
    image = love.graphics.newImage('assets/sprites/traps/spikes.png'),
    quads = {},

    radius = 32,
    bodyType = 'static',
    isSensor = true,

    state = LOADED,
    delay = 1,
}

function SpikeTrap:init(world, x, y)
    self:createBody(world, x, y)

    local ix, iy = self.image:getDimensions()
    local width, height = 64, 64
    self.quads[LOADED]  = love.graphics.newQuad(0, 0,      width, height, ix, iy)
    self.quads[TRIPPED] = love.graphics.newQuad(width, 0,  width, height, ix, iy)
    self.quads[SPRUNG]  = love.graphics.newQuad(0, height, width, height, ix, iy)
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
    local x, y = self:bodyPosition()
    love.graphics.draw(self.image, self.quads[self.state], x, y, 0, 1, 1, self.radius, self.radius)
end

function SpikeTrap:changeState(state)
    self.state = state
    AudioManager:play('assets/audio/spike_trap_' .. state .. '.ogg')
end

function SpikeTrap:beginContact(other)
    if self.state == LOADED then
        self:changeState(TRIPPED)
    elseif self.state == SPRUNG and other.damage then
        other:damage()
    end
end
