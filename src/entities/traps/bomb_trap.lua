-- make some local state consts
local IDLE, TRIPPED = 'idle', 'tripped'

BombTrap = Class{
    __includes = {Killable},
    classname = 'BombTrap',
    sprite = SpriteComponent('assets/sprites/traps/bomb.png'),
    radius = 32,
    state = IDLE,
    delay = 1,
    death_audio = false,
}

function BombTrap:init(world, x, y)
    self:createBody(world, x, y)
end

function BombTrap:update(dt)
    if self.state == TRIPPED then
        self.delay = self.delay - dt
        if self.delay < 0 then
            self:kill()
            WorldScene:addEnt('Misc', BombBlast(WorldScene.physics, self.body:getPosition()))
        end
    end
end

function BombTrap:draw()
    local color = (self.delay * 255)
    love.graphics.setColor(255, color, color)
    local x, y = self.body:getPosition()
    self.sprite:draw(x, y)
    love.graphics.setColor(255, 255, 255)
end

function BombTrap:createBody(world, x, y)
    self.body = love.physics.newBody(world, x, y, "dynamic")

    self.shape   = love.physics.newCircleShape(self.radius)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
end

function BombTrap:beginContact(other)
    if other.damage and self.state == IDLE then
        self.state = TRIPPED
        AudioManager:play('assets/audio/bomb_hiss.ogg')
    end
end
