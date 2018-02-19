Class       = require "libraries.hump.class"
Gamestate   = require "libraries.hump.gamestate"
sti         = require "libraries.sti"
Grid        = require "libraries.jumper.grid"
Pathfinder  = require "libraries.jumper.pathfinder"
inspect     = require "libraries.inspect"
anim8       = require "libraries.animation.anim8"

function love.load()
    local requireDir = function(dir)
        local files = love.filesystem.getDirectoryItems(dir)
        for _, file in pairs(files) do
            if string.sub(file, -4) == ".lua" then
                require(dir .. '/' .. string.gsub( file, ".lua", ""))
            end
        end
    end

    requireDir('entities')
    requireDir('scenes')
    requireDir('singletons')

    Music:play("assets/audio/bgm.ogg")

    Gamestate.registerEvents()
    Gamestate.switch(SplashScene)
end

function love.update(dt)
    Fader:update(dt)
end
