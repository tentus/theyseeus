Gem = Class{
    __includes = {Killable, Sensable},
    classname = 'Gem',
    sprite = SpriteComponent("assets/sprites/items/gem.png"),
    glow = GlowComponent(),
    death_audio = "assets/audio/collect.ogg",
}

function Gem:init(x, y)
    Sensable.init(self, x, y)
end

function Gem:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Gem:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Gem:playerSensed(player)
    WorldScene:addEnt("Pickups", RippleEffect(self.x, self.y, {128, 255, 255}))
    local total = InventoryManager:collect(self.classname)
    self:kill()

    if total == 1 then
        Gamestate.push(DialogScene, "AboutGem")
    end
end
