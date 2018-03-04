CreditsScene = {
    speed = 100,
    logo = SpriteComponent('assets/logos/theyseeus_logo.png'),
    text = [[

Colin Johnson
twitter.com/crittecol

Molly Van Gilder
twitter.com/MollyVanGilder

Nick Johnson
twitter.com/n1carus

Thomas Holden
twitter.com/tsholden



Powered by Love
love2d.org

anim8 by Enrique García Cota
github.com/kikito/inspect.lua

Baton by Andrew Minnich
github.com/tesselode/baton

hump by Matthias Richter
github.com/vrld/hump

jumper by Roland Yonaba
github.com/Yonaba/Jumper

lovebird by rxi
github.com/rxi/lovebird

Simple Tiled Implementation by Landon Manning
github.com/karai17/Simple-Tiled-Implementation



"Mark of the Beast" by Nate Piekos
blambot.com



Thank you for playing!
]]
}

function CreditsScene:enter()
    self.y = love.graphics.getHeight() + (self.logo.y * 2)
    local _, count = string.gsub(self.text, '\n', '')
    self.limit = count * -18
end

function CreditsScene:update(dt)
    self.y = self.y - (self.speed * dt)
    if self.y < self.limit then
        self.finish()
    end
end

function CreditsScene:draw()
    local width, height = love.window.getMode()
    self.logo:draw(width / 2, math.floor(self.y) - self.logo.y)
    love.graphics.printf(self.text, 0, math.floor(self.y), width, "center")
end

function CreditsScene:keyreleased()
    self.finish()
end

function CreditsScene:finish()
    Gamestate.pop()
end
