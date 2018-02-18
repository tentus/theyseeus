Class       = require "libraries.hump.class"
Gamestate   = require "libraries.hump.gamestate"
sti         = require "libraries.sti"
Grid        = require "libraries.jumper.grid"
Pathfinder  = require "libraries.jumper.pathfinder"

function love.load()
    local requireDir = function(dir)
        local files = love.filesystem.getDirectoryItems(dir)
        for _, file in pairs(files) do
            require(dir .. '/' .. string.gsub( file, ".lua", ""))
        end
    end

    requireDir('entities')
    requireDir('scenes')
    requireDir('singletons')

    Gamestate.registerEvents()
    Gamestate.switch(SplashScene)
end

function love.update(dt)
    Fader:update(dt)
end
