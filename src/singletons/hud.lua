local function hudImage(file)
    return love.graphics.newImage('assets/sprites/hud/' .. file)
end

HUD = {
    edge = 10,
    show = {
        health    = true,
        inventory = true,
        hearing   = true,
        map       = true,
        fps       = true,
    },
    images = {
        hearing = hudImage('hearing.png'),
        health  = hudImage('health_icon.png'),
        damage  = hudImage('damage_icon.png'),
        yarn    = hudImage('yarn_icon.png'),
        coin    = hudImage('coin_icon.png'),
    },
}

function HUD:toggle(which)
    self.show[which] = not self.show[which]
end

function HUD:draw()
    local width, height = love.window.getMode()

    if self.show.hearing and InventoryManager:total(Horn.classname) > 0 then
        local x, y = WorldScene:playerPosition()
        for _, ent in pairs(WorldScene:namedLayer('Minotaurs').ents) do
            if ent.classname == NPC.classname and ent.body and not ent.body:isDestroyed() then
                local x2, y2 = ent.body:getPosition()
                local dist = WorldScene:distFromPlayer(x2, y2) ^ 0.5
                local r = math.atan2(y2 - y, x2 - x)

                love.graphics.setColor(255, 255, 255, math.min((512 / dist) * 128, 255))
                love.graphics.draw(self.images.hearing, width / 2, height / 2, r, 1, 1, 0, 64)
            end
        end
        love.graphics.setColor(255, 255, 255)
    end

    local spacing = 40

    -- health in top left
    if self.show.health then
        local player = WorldScene.player
        for i=1, player.maxHealth do
            local icon = ((player.health < i) and self.images.damage or self.images.health)
            love.graphics.draw(icon, ((i - 1) * spacing) + self.edge, self.edge)
        end
    end

    -- map in the top right
    if self.show.map then
        love.graphics.push()
        love.graphics.translate(width - self.edge, self.edge)
        RegionManager:draw()
        love.graphics.pop()
    end

    -- yarn and coins total in bottom left
    if self.show.inventory then
        love.graphics.push()
        love.graphics.translate(self.edge, height - self.edge)
        love.graphics.draw(self.images.yarn, 0, -spacing)
        love.graphics.print('x ' .. InventoryManager:total(Yarn.classname), spacing, 8 - spacing)

        love.graphics.draw(self.images.coin, 0, -spacing * 2)
        love.graphics.print('x ' .. InventoryManager:total(Coin.classname), spacing, 8 - (spacing * 2))
        love.graphics.pop()
    end
end

function HUD:drawFPS()
    if self.show.fps then
        local width, height = love.window.getMode()
        love.graphics.printf(love.timer.getFPS(), -self.edge, height - 20 - self.edge, width, "right")
    end
end

function HUD:changeEdge(delta)
    -- for now we assume the change is positive
    self.edge = (self.edge + delta) % 200
end
