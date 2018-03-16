Freeze = Class{
    __includes = {BaseItem, Explicable},
    classname = 'Freeze',
    radius = 16,
    sprite = SpriteComponent('assets/sprites/items/freeze.png'),
    glow = GlowComponent(),

    -- the odds we'll spawn, eg 1 in 10 chance per region loaded
    chance = 10,

    explanationDialog = 'AboutFreeze',
    logEvent = 'Freeze Collected',
}

function Freeze:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Freeze:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Freeze:playerSensed(player)
    WorldScene:addEnt('Pickups', FreezeEffect(self.x, self.y))

    for _, ent in pairs(WorldScene:namedLayer('Minotaurs').ents) do
        ent.frozen = true
    end

    self:kill()
    Logger:add(self.logEvent)
    self:explain()
end

function Freeze:shouldExplain()
    return Logger.events[self.logEvent] == 1
end
