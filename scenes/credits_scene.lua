CreditsScene = {
    speed = 100,
    text = [[
They See Us



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

hump by Matthias Richter
github.com/vrld/hump

jumper by Roland Yonaba
github.com/Yonaba/Jumper

STI by Landon Manning
github.com/karai17/Simple-Tiled-Implementation



Thank you for playing!
]]
}

function CreditsScene:enter()
    self.y = love.graphics.getHeight() + 10
    local _, count = string.gsub(self.text, "\n", "")
    self.limit = count * -18
end

function CreditsScene:update(dt)
    self.y = self.y - (self.speed * dt)
    if self.y < self.limit then
        self.finish()
    end
end

function CreditsScene:draw()
    love.graphics.printf(self.text, 0, math.floor(self.y), love.graphics.getWidth(), "center")
end

function CreditsScene:keypressed()
    self.finish()
end

function CreditsScene:finish()
    Gamestate.switch(MenuScene)
end
