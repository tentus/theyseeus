SplashScene = {
    step = 0,
    time = {
        passed = 0,
        limit = 4,
    },
    logos = {
        love.graphics.newImage("assets/logos/beardville_logo.png"),
        love.graphics.newImage("assets/logos/love_logo.png"),
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
    local x = (screenWidth / 2) - (self.imageWidth / 2)
    local y = (screenHeight / 2) - (self.imageHeight / 2)
    love.graphics.draw(
        self.image,
        x,
        y
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
        self:updateImageProperties()
        Fader:start(255, 1)
    end
end

function SplashScene:updateImageProperties()
    self.image = self.logos[self.step]
    self.imageWidth, self.imageHeight = self.image:getDimensions()
end
