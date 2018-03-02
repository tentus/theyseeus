Map = Class{
    __includes = {Killable, Sensable},
    classname = 'Map',
    sprite = SpriteComponent("assets/sprites/items/map.png"),
    glow = GlowComponent(),
    death_audio = "assets/audio/collect.ogg",
}

function Map:init(x, y)
    Sensable.init(self, x, y)
end

function Map:draw()
    self.glow:draw(self.x, self.y)
    self.sprite:draw(self.x, self.y)
end

function Map:update(dt)
    Sensable.update(self, dt)
    self.glow:update(dt)
end

function Map:playerSensed(player)
    WorldScene:addEnt("Pickups", RippleEffect(self.x, self.y, {255, 128, 128}))
    local total = InventoryManager:collect(self.classname)
    self:kill()

    if total == 1 then
        Gamestate.push(DialogScene, "AboutMap")
    end
end
