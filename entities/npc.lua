NPC = Class{
    __includes = {Minotaur, Damagable, Killable},
    classname = 'NPC',
    force = 4000,
    goal = nil,
    angry = false,
    hearing = {},
}

function NPC:init(world, x, y)
    Minotaur.init(self, world, x, y)
    self:setHearing(192)

    -- make some NPCs faster than others, to make chases more interesting
    self.force = self.force + love.math.random(1, 1000)
end

function NPC:update(dt)
    Damagable.update(self, dt)
    Minotaur.update(self, dt)

    -- we do not set the goal at spawn, because not all spawn points will have been registered yet
    if not self.goal then
        self:pickNewGoal()
    end

    local x, y = self.body:getPosition()
    local px, py = self.goal:getTargetPosition()

    -- we recalc constantly because we're constantly catching up to our destination
    local node, len = WorldScene.pathManager:getNextPathNode(x, y, px, py)

    -- if we've arrived at our destination, pick a new goal for the next update
    -- we're using anger here to avoid getting distracted after near-misses
    if not self.angry and len == 0 then
        self:pickNewGoal()
        return
    end

    -- we don't apply force unless we're far enough from it to be worthwhile, to avoid jitter
    local threshold = 4
    local h, v = 0, 0
    if math.abs(node.x - x) > threshold then
        if node.x < x then h = -1 end
        if node.x > x then h = 1 end
    end
    if math.abs(node.y - y) > threshold then
        if node.y < y then v = -1 end
        if node.y > y then v = 1 end
    end

    if h ~= 0 or v ~= 0 then
        -- npcs move much slower when they're not angry
        local force = self.angry and self.force or (self.force / 4)
        self.body:applyForce(h * force, v * force)
    end
end

function NPC:pickNewGoal()
    local count = #WorldScene.pointsOfInterest
    local pick = WorldScene.pointsOfInterest[love.math.random(count)]
    if pick ~= self.goal then
        self.goal = pick
    elseif count > 1 then       -- don't wanna end up in an infinite loop
        self:pickNewGoal()
    end
end

function NPC:setHearing(radius)
    self.hearing.shape   = love.physics.newCircleShape(0, -16, radius)
    self.hearing.fixture = love.physics.newFixture(self.body, self.hearing.shape)
    self.hearing.fixture:setSensor(true)
    self.hearing.fixture:setUserData({
        beginContact = function(_, other)
            -- todo: implement Hatred system
            if other.getTargetPosition then
                self.goal = other
                self.angry = true
            end
        end
    })

    -- each shape affixed will affect the mass, so we have to reset it each time
    self.body:setMass(1)
end

function NPC:beginContact(other)
    if other.damage then
        other:damage()
    end
end
