HUD = {
    show = {
        health    = true,
        inventory = true,
        hearing   = true,
    },
    images = {
        hearing = love.graphics.newImage("assets/sprites/hud/hearing.png"),
        health  = love.graphics.newImage("assets/sprites/hud/health_icon.png"),
        damage  = love.graphics.newImage("assets/sprites/hud/damage_icon.png"),
        yarn    = love.graphics.newImage("assets/sprites/hud/yarn_icon.png"),
        coin    = love.graphics.newImage("assets/sprites/hud/coin_icon.png"),
    },
}

function HUD:toggle(which)
    self.show[which] = not self.show[which]
end

function HUD:draw()
    local width, height = love.window.getMode()
    local player = WorldScene.player

    if self.show.hearing and InventoryManager:total(Horn.classname) > 0 then
        local x, y = player.body:getPosition()
        for _, ent in pairs(WorldScene.map.layers["Minotaurs"].ents) do
            if ent.body and not ent.body:isDestroyed() then
                local x2, y2 = ent.body:getPosition()
                local dist = ((x2 - x) ^ 2 + (y2 - y) ^ 2) ^ 0.5
                local r = math.atan2(y2 - y, x2 - x)

                love.graphics.setColor(255, 255, 255, math.min((512 / dist) * 128, 255))
                love.graphics.draw(self.images.hearing, width / 2, height / 2, r, 1, 1, 0, 64)
            end
        end
        love.graphics.setColor(255, 255, 255)
    end

    -- health in top left
    if self.show.health then
        for i=1, player.maxHealth do
            local icon = ((player.health < i) and self.images.damage or self.images.health)
            love.graphics.draw(icon, (i * 40) - 32, 8)
        end
    end

    -- yarn and coins total in bottom left
    if self.show.inventory then
        love.graphics.draw(self.images.yarn, 8, height - 40)
        love.graphics.print(' x ' .. InventoryManager:total(Yarn.classname), 40, height - 32)

        love.graphics.draw(self.images.coin, 8, height - 80)
        love.graphics.print(' x ' .. InventoryManager:total(Coin.classname), 40, height - 64)
    end
end
