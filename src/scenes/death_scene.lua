DeathScene = {
    image = SpriteComponent('assets/logos/you_died.png'),
}

function DeathScene:enter(from)
    self.from = from -- record previous state
    self.alpha = 0
    Fader:start(0, 3)
end

function DeathScene:update(dt)
    self.alpha = self.alpha + dt
end

function DeathScene:draw()
    -- draw underlying screen
    self.from:draw()

    love.graphics.setColor(255,255,255, 255 * math.min(self.alpha, 1))
    self.image:draw(
        (love.graphics.getWidth() / 2),
        (love.graphics.getHeight() / 2)
    )
    love.graphics.setColor(255, 255, 255)
end

function DeathScene:keypressed()
    RegionManager:warpHome()
    WorldScene.player.health = WorldScene.player.maxHealth
    WorldScene:loadRegion('Start')
    Gamestate.pop()
end

