-- make some local state consts
local IDLE, TRIPPED = 'idle', 'tripped'

BombTrap = Class{
    __includes = {Killable, Physical},
    classname = 'BombTrap',
    sprite = SpriteComponent('assets/sprites/traps/bomb.png'),
    radius = 32,
    state = IDLE,
    delay = 1,

    -- prevent npcs from trying to path through us while idle
    fillsGrid = true,
}

function BombTrap:init(world, x, y)
    self:createBody(world, x, y)
end

function BombTrap:update(dt)
    if self.state == TRIPPED then
        self.delay = self.delay - dt
        if self.delay < 0 then
            self:kill()
            WorldScene:addEnt('Misc', BombBlast(WorldScene.physics, self:bodyPosition()))
        end
    end
end

function BombTrap:draw()
    local color = (self.delay * 255)
    love.graphics.setColor(255, color, color)
    local x, y = self:bodyPosition()
    self.sprite:draw(x, y)
    love.graphics.setColor(255, 255, 255)
end

function BombTrap:beginContact(other)
    if (other.damage or other.classname == BombBlast.classname) and self.state == IDLE then
        self.state = TRIPPED
        AudioManager:play('assets/audio/bomb_hiss.ogg')

        -- once tripped we might be in motion, so better to go ahead and make this item invisible to the grid
        self.fillsGrid = false
        WorldScene.pathManager:entCollisions():build()
    end
end
