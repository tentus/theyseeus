SplashScene = {
    step = 0,
    time = {
        passed = 0,
        limit = 4,
    },
    logos = {
        Sprite("assets/logos/beardville_logo.png"),
        Sprite("assets/logos/love_logo.png"),
    },
}

function SplashScene:init()
    self:proceed()
end

function SplashScene:update(dt)
    self.time.passed = self.time.passed + dt
    if self.time.passed >= self.time.limit then
        self:proceed()
    end
end

function SplashScene:draw()
    local screenWidth, screenHeight = love.window.getMode()
    self.logos[self.step]:draw(
        (screenWidth / 2),
        (screenHeight / 2)
    )

    Fader:draw()
end

function SplashScene:keypressed()
    self:proceed()
end

function SplashScene:proceed()
    if self.step < #self.logos then
        self.time.passed = 0
        self.step = self.step + 1
        Fader:start(255, 1)
    else
        Gamestate.switch(MenuScene)
    end
end
