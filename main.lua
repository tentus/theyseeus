Class       = require "libraries.hump.class"
Gamestate   = require "libraries.hump.gamestate"
inspect     = require "libraries.inspect"
anim8       = require "libraries.animation.anim8"

requireDir = function(dir)
    local files = love.filesystem.getDirectoryItems(dir)
    for _, file in pairs(files) do
        if string.sub(file, -4) == ".lua" then
            require(dir .. '/' .. string.gsub( file, ".lua", ""))
        else
            requireDir(dir .. '/' .. file)
        end
    end
end

function love.load()
    requireDir('entities')
    requireDir('scenes')
    requireDir('singletons')

    AudioManager:stream("assets/audio/bgm.ogg")
    love.graphics.setFont(
        love.graphics.newFont(16)
    )

    Gamestate.registerEvents()
    Gamestate.switch(SplashScene)
end

function love.update(dt)
    Fader:update(dt)
    Bindings:update()
end
