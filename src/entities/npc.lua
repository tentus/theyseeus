NPC = Class{
    __includes = {Minotaur, Damagable, Killable},
    classname = 'NPC',
    bravado = 0,    --range from 1 to 1000
    force = 4000,   -- will have up to 1000 added on init
    goal = nil,
    angry = false,
    hearing = {},
    death_audio = 'assets/audio/die.ogg',
}

function NPC:init(world, x, y)
    Minotaur.init(self)

    -- set up physics bodies
    self:createBody(world, x, y)
    self:setHearing(192)

    -- make some NPCs faster than others, to make chases more interesting
    self.force = self.force + love.math.random(1, 1000)

    -- every NPC has a "bravado" value, that is used for tie-breaking mutual attacks
    self.bravado = love.math.random(1, 1000)
end

function NPC:update(dt)
    -- if we've been frozen, then no updates for us
    if self.frozen then return end

    Damagable.update(self, dt)
    Minotaur.update(self, dt)

    -- we do not set the goal at spawn, because not all spawn points will have been registered yet
    if not self.goal then
        self:pickNewGoal()
    end

    local x, y = self:bodyPosition()
    local px, py = self.goal:getTargetPosition()

    -- once we're within touching distance of our goal, pick a new goal for the next update
    if not self.angry and math.abs(px - x) < self.radius and math.abs(py - y) < self.radius then
        self:pickNewGoal()
        self.nextNode = nil
        return
    end

    -- recalc constantly when angry or every time we get close to a static goal
    if not self.nextNode or self.angry or (math.abs(self.nextNode.x - x) < self.radius and math.abs(self.nextNode.y - y) < self.radius) then
        self.nextNode = WorldScene.pathManager:getNextPathNode(x, y, px, py)
    end

    local threshold = self.radius
    local h = math.min(math.max(self.nextNode.x - x, -threshold), threshold)
    local v = math.min(math.max(self.nextNode.y - y, -threshold), threshold)

    -- npcs move much slower when they're not angry
    local force = self.angry and self.force or (self.force / 4)
    self.body:applyForce((h * force) / threshold, (v * force) / threshold)
end

function NPC:draw()
    Minotaur.draw(self)

    -- bluish overlay if we're frozen
    if self.frozen then
        love.graphics.setBlendMode("add")
        love.graphics.setColor(0, 0.5, 1)
        Minotaur.draw(self)
        love.graphics.setColor(1, 1, 1)
        love.graphics.setBlendMode("alpha")
    end

    if npc_debug then
        local x, y = self:bodyPosition()
        love.graphics.circle("line", x, y, self.radius)
        love.graphics.circle("line", x, y, self.hearing.shape:getRadius())
        if self.nextNode then
            local n = self.nextNode
            love.graphics.circle("line", n.x, n.y, 4)
            love.graphics.line(x, y, n.x, n.y)
        end
        if self.goal then
            local gx, gy = self.goal:getTargetPosition()
            love.graphics.line(x, y, gx, gy)
            love.graphics.circle("line", gx, gy, 8)
        end
    end
end

function NPC:pickNewGoal()
    local pick, count = WorldScene:randNavPoint()
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
                -- don't let npcs attack each other if it's not onscreen
                -- this is a mix of rule-of-cool and "wait why is that dying sound playing"
                if other.classname ~= Player.classname and not WorldScene.camera:onScreen(self:bodyPosition()) then return end

                self.goal = other
                self.angry = true
            end
        end
    })

    -- each shape affixed will affect the mass, so we have to reset it each time
    self.body:setMass(1)
end

function NPC:beginContact(other)
    -- when two NPCs attack each other, we compare their bravado. if they happen to be tied, then they both die.
    if other.damage and (other.bravado or 0) <= self.bravado then
        other:damage()

        -- if the other guy is ko'd, then let's calm down and wander off
        if other.health < 1 then
            self.angry = false
            self:pickNewGoal()
        end
    end
end

function NPC:kill()
    -- we're counting on the NPCs to have been spawned in the layer matching their type
    WorldScene:addEnt('Minotaurs', ExplosionEffect(self:bodyPosition()))
    Killable.kill(self)
    Logger:add('NPCs killed')
end
