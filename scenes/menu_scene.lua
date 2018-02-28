MenuScene = {
    level = "root",
    cursor = 1,
    options = {
        root = {   -- top menu
            {
                function()
                    return WorldScene.entered and "Continue" or "Play"
                end,
                function()
                    Gamestate.switch(WorldScene)
                end
            },
            {
                "Video Settings",
                function()
                    MenuScene:goTo("settings")
                end
            },
            {
                "Audio Settings",
                function()
                    MenuScene:goTo("audio")
                end
            },
            {
                "Stats",
                function()
                    MenuScene:goTo("stats")
                end
            },
            {
                "Credits",
                function()
                    Gamestate.switch(CreditsScene)
                end
            },
            {
                "Quit",
                function()
                    love.event.quit()
                end
            },
        },
        settings = {
            {
                "Fullscreen",
                function()
                    love.window.setFullscreen(not love.window.getFullscreen())
                end
            },
            {
                "VSYNC",
                function()
                    MenuScene:setWindowFlag("vsync")
                end
            },
            {
                "Window Border",
                function()
                    MenuScene:setWindowFlag("borderless")
                end
            },
            {
                "Toggle FPS",
                function()
                    FPS:toggle()
                end
            },
            {
                "Toggle HUD",
                function()
                    HUD:toggle()
                end
            },
            {
                "Back",
                function()
                    MenuScene:goTo("root")
                end
            },
        },
        audio = {
            {
                function()
                    return "Master Volume: " .. AudioManager:getVolume("master")
                end,
                function()
                    AudioManager:changeVolume("master", -.1)
                end
            },
            {
                function()
                    return "Music Volume: " .. AudioManager:getVolume("music")
                end,
                function()
                    AudioManager:changeVolume("music", -.1)
                end
            },
            {
                function()
                    return "SFX Volume: " .. AudioManager:getVolume("sfx")
                end,
                function()
                    AudioManager:changeVolume("sfx", -.1)
                end
            },
            {
                "Back",
                function()
                    MenuScene:goTo("root")
                end
            },
        },
        stats = {
            {
                function()
                    return Logger:print()
                end,
                function()
                    MenuScene:goTo("root")
                end
            },
        },
    },
    lineHeight = 36,
    logo = Sprite("assets/logos/theyseeus_logo.png"),
}

function MenuScene:draw()
    local width, height = love.window.getMode()
    local halfWidth = width / 2
    local halfHeight = height / 2

    self.logo:draw(halfWidth, halfHeight - self.logo.y)

    for i=1, #self.options[self.level] do
        if i == self.cursor then
            love.graphics.print('->', halfWidth - 32, halfHeight + (i * self.lineHeight))
        end

        love.graphics.print(self:value(self.options[self.level][i][1]), halfWidth, halfHeight + (i * self.lineHeight))
    end

    FPS:draw()
end

function MenuScene:update(dt)
    if Bindings:pressed('up') then
        self.cursor = self.cursor - 1
        if self.cursor < 1 then
            self.cursor = #self.options[self.level]
        end
    elseif Bindings:pressed('down') then
        self.cursor = self.cursor + 1
        if self.cursor > #self.options[self.level] then
            self.cursor = 1
        end
    elseif Bindings:pressed('action') then
        self.options[self.level][self.cursor][2]()
    elseif Bindings:pressed('cancel') then
        if self.level ~= "root" then
            self:goTo("root")
        elseif WorldScene.entered then
            Gamestate.switch(WorldScene)
        end
    end
end

-- if the value passed is a function, return its return value
function MenuScene:value(value)
    if type(value) == "function" then
        value = value()
    end
    return value
end

function MenuScene:goTo(level)
    self.cursor = 1
    self.level = level
end

function MenuScene:setWindowFlag(flag)
    local w, h, f = love.window.getMode()
    f[flag] = not f[flag]
    love.window.setMode(w, h, f)
end
