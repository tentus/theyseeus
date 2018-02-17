Class       = require "libraries.hump.class"
Gamestate   = require "libraries.hump.gamestate"
sti         = require "libraries.sti"

function love.load()
    local requireDir = function(dir)
        local files = love.filesystem.getDirectoryItems(dir)
        for _, file in pairs(files) do
            require(dir .. '/' .. string.gsub( file, ".lua", ""))
        end
    end

    requireDir('scenes')

    Gamestate.registerEvents()
    Gamestate.switch(SplashScene)
end
