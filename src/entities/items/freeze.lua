Freeze = Class{
    __includes = {Killable, Sensable},
    classname = 'Freeze',
    radius = 16,
    sprite = SpriteComponent('assets/sprites/items/freeze.png'),
    glow = GlowComponent(),
    death_audio = 'assets/audio/collect.ogg',

    -- the odds we'll spawn, eg 1 in 10 chance per region loaded
    chance = 10,
}

function Freeze:init(x, y)
    Sensable.init(self, x, y)
end

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
    local total = Logger:add('Freeze Collected')
    if total == 1 then
        Gamestate.push(DialogScene, 'AboutFreeze')
    end
end
