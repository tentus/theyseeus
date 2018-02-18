NPC = Class{
    __includes = Minotaur,
    classname = 'NPC',
    pathnode = {
        x = 0,
        y = 0,
    },
    force = 4000,
    sleeping = true,
    hearing = {},
}

function NPC:init(x, y, world)
    Minotaur.init(self, x, y, world)
    self:setHearing(192)
end

function NPC:update(dt)
    if self.sleeping then
        return
    end

    local x, y = self.body:getPosition()
    local px, py = WorldScene.player.body:getPosition()

    -- we recalc constantly because we're constantly catching up to our destination
    self.pathnode = WorldScene.pathManager:getNextPathNode(x, y, px, py)

    -- we don't apply force unless we're far enough from it to be worthwhile, to avoid jitter
    local threshold = 4
    local h, v = 0, 0
    if math.abs(self.pathnode.x - x) > threshold then
        if self.pathnode.x < x then h = -1 end
        if self.pathnode.x > x then h = 1 end
    end
    if math.abs(self.pathnode.y - y) > threshold then
        if self.pathnode.y < y then v = -1 end
        if self.pathnode.y > y then v = 1 end
    end
    self.body:applyForce(h * self.force, v * self.force)
end

function NPC:draw()
    Minotaur.draw(self)
    if self.sleeping then
        love.graphics.print("z z Z Z Z", self.body:getX(), self.body:getY() - 128)
    end
end

function NPC:setHearing(radius)
    self.hearing.shape   = love.physics.newCircleShape(0, -16, radius)
    self.hearing.fixture = love.physics.newFixture(self.body, self.hearing.shape)
    self.hearing.fixture:setSensor(true)
    self.hearing.fixture:setUserData({
        beginContact = function(_, other)
            if other.classname == "Player" or other.classname == "NPC" then
                self.sleeping = false
            end
        end
    })

    -- each shape affixed will affect the mass, so we have to reset it each time
    self.body:setMass(1)
end
