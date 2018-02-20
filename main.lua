Class       = require "libraries.hump.class"
Gamestate   = require "libraries.hump.gamestate"
sti         = require "libraries.sti"
Grid        = require "libraries.jumper.grid"
Pathfinder  = require "libraries.jumper.pathfinder"
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

    AudioManager:play("assets/audio/bgm.ogg")

    Gamestate.registerEvents()
    Gamestate.switch(SplashScene)
end

function love.update(dt)
    Fader:update(dt)
end
