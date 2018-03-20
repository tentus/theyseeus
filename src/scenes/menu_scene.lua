local back = {
    'Back',
}

-- if the value passed is a function, return its return value
local function value(v)
    return (type(v) == 'function') and v() or v
end

local function playGame()
    Gamestate.push(WorldScene)
end

local function setWindowFlag(flag)
    local w, h, f = love.window.getMode()
    f[flag] = not f[flag]
    love.window.setMode(w, h, f)
end

MenuScene = {
    level = 'root',
    backTrack = {},
    cursor = 1,
    options = {
        root = {   -- top menu
            {
                function()
                    return WorldScene.entered and 'Continue' or 'Play'
                end,
                function()
                    playGame()
                end
            },
            {
                'Settings',
                'settings'
            },
            {
                'Stats',
                'stats'
            },
            {
                'Credits',
                function()
                    Gamestate.push(CreditsScene)
                end
            },
            {
                'Quit',
                function()
                    love.event.quit()
                end
            },
        },
        settings = {
            {
                'HUD Settings',
                'hud'
            },
            {
                'Video Settings',
                'video'
            },
            {
                'Audio Settings',
                'audio'
            },
            back
        },
        video = {
            {
                'Fullscreen',
                function()
                    love.window.setFullscreen(not love.window.getFullscreen())
                end
            },
            {
                'VSYNC',
                function()
                    setWindowFlag('vsync')
                end
            },
            {
                'Window Border',
                function()
                    setWindowFlag('borderless')
                end
            },
            back
        },
        hud = {
            {
                'Toggle FPS',
                function()
                    HUD:toggle('fps')
                end
            },
            {
                'Toggle Map',
                function()
                    HUD:toggle('map')
                end
            },
            {
                'Toggle Health',
                function()
                    HUD:toggle('health')
                end
            },
            {
                'Toggle Inventory',
                function()
                    HUD:toggle('inventory')
                end
            },
            {
                'Toggle Hearing',
                function()
                    HUD:toggle('hearing')
                end
            },
            {
                function()
                    return 'Edge Distance: ' .. HUD.edge
                end,
                function()
                    HUD:changeEdge(10)
                end
            },
            back
        },
        audio = {
            {
                function()
                    return 'Master Volume: ' .. AudioManager:getVolume('master')
                end,
                function()
                    AudioManager:changeVolume('master', -.1)
                end
            },
            {
                function()
                    return 'Music Volume: ' .. AudioManager:getVolume('music')
                end,
                function()
                    AudioManager:changeVolume('music', -.1)
                end
            },
            {
                function()
                    return 'SFX Volume: ' .. AudioManager:getVolume('sfx')
                end,
                function()
                    AudioManager:changeVolume('sfx', -.1)
                end
            },
            back
        },
        stats = {
            {
                function()
                    return Logger:print()
                end,
            },
        },
    },
    lineHeight = 36,
    logo = SpriteComponent('assets/logos/theyseeus_logo.png'),
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

        love.graphics.print(value(self.options[self.level][i][1]), halfWidth, halfHeight + (i * self.lineHeight))
    end

    HUD:drawFPS()
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
        local action = self.options[self.level][self.cursor][2]
        if type(action) == 'function' then
            action()
        elseif action then
            table.insert(self.backTrack, self.level)
            self:goTo(action)
        else
            self:goBack()
        end
    elseif Bindings:pressed('cancel') then
        if self.level ~= 'root' then
            self:goBack()
        elseif WorldScene.entered then
            playGame()
        end
    end
end

function MenuScene:goBack()
    self:goTo(self.backTrack[#self.backTrack])
    table.remove(self.backTrack)
end

function MenuScene:goTo(level)
    self.cursor = 1
    self.level = level
end
