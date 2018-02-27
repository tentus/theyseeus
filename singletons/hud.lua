HUD = {
    show = true,
    icons = {
        health = love.graphics.newImage("assets/sprites/hud/health_icon.png"),
        damage = love.graphics.newImage("assets/sprites/hud/damage_icon.png"),
        yarn   = love.graphics.newImage("assets/sprites/hud/yarn_icon.png"),
        coin   = love.graphics.newImage("assets/sprites/hud/coin_icon.png"),
    }
}

function HUD:toggle()
    self.show = not self.show
end

function HUD:draw()
    if not self.show then return end

    -- health in top left
    for i=1, WorldScene.player.maxHealth do
        local icon = ((WorldScene.player.health < i) and self.icons.damage or self.icons.health)
        love.graphics.draw(icon, (i * 40) - 32, 8)
    end

    local height = love.graphics.getHeight()

    -- yarn and coins total in bottom left
    love.graphics.draw(self.icons.yarn, 8, height - 40)
    love.graphics.print(' x ' .. InventoryManager:total(Yarn.classname), 40, height - 32)

    love.graphics.draw(self.icons.coin, 8, height - 80)
    love.graphics.print(' x ' .. InventoryManager:total(Coin.classname), 40, height - 64)
end
