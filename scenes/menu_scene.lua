MenuScene = {
    level = "root",
    cursor = 1,
    options = {
        root = {   -- top menu
            {
                function()
                    -- todo: newgame vs continue
                    return "Play"
                end,
                function()
                    Gamestate.switch(WorldScene)
                end
            },
            {
                "Settings",
                function()
                    MenuScene:goTo("settings")
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
                "Toggle FPS",
                function()
                    FPS:toggle()
                end
            },
            {
                function()
                    return "Music Volume: " .. AudioManager.volume
                end,
                function()
                    AudioManager:changeVolume(-25)
                end
            },
            {
                "Back",
                function()
                    MenuScene:goTo("root")
                end
            },
        },
    },
    lineHeight = 36,
    logo = love.graphics.newImage("assets/logos/theyseeus_logo.png"),
}

function MenuScene:draw()
    local width, height = love.window.getMode()
    local halfWidth = width / 2
    local halfHeight = height / 2

    love.graphics.draw(self.logo, halfWidth, halfHeight, 0, 1, 1, self.logo:getWidth() / 2, self.logo:getHeight())

    for i=1, #self.options[self.level] do
        if i == self.cursor then
            love.graphics.print('->', halfWidth - 32, halfHeight + (i * self.lineHeight))
        end

        love.graphics.print(self:value(self.options[self.level][i][1]), halfWidth, halfHeight + (i * self.lineHeight))
    end

    FPS:draw()
end

function MenuScene:keypressed(key)
    if key == "up" or key == "w" then
        self.cursor = self.cursor - 1
        if self.cursor < 1 then
            self.cursor = #self.options[self.level]
        end
    elseif key == "down" or key == "s" then
        self.cursor = self.cursor + 1
        if self.cursor > #self.options[self.level] then
            self.cursor = 1
        end
    elseif key == "return" or key == "space" or key == "tab" then
        self.options[self.level][self.cursor][2]()
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
