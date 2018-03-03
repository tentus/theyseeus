Class       = require 'libraries.hump.class'
Gamestate   = require 'libraries.hump.gamestate'
lovebird    = require 'libraries.lovebird'
anim8       = require 'libraries.animation.anim8'

function love.load()
    local function requireDir(dir)
        local files = love.filesystem.getDirectoryItems(dir)
        for _, file in pairs(files) do
            if string.sub(file, -4) == '.lua' then
                require(dir .. '/' .. string.gsub( file, '.lua', ''))
            else
                requireDir(dir .. '/' .. file)
            end
        end
    end

    requireDir('src')

    AudioManager:stream('assets/audio/bgm.ogg')
    love.graphics.setFont(
        love.graphics.newFont(16)
    )

    Gamestate.registerEvents()
    Gamestate.switch(SplashScene)
end

function love.update(dt)
    lovebird.update()
    Fader:update(dt)
    Bindings:update()
end
