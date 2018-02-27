HUD = {
    show = true,
    icons = {
        health = love.graphics.newImage("assets/sprites/health_icon.png"),
        damage = love.graphics.newImage("assets/sprites/damage_icon.png"),
        yarn   = love.graphics.newImage("assets/sprites/items/yarn.png"),
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

    -- yarn total in bottom left
    local height = love.graphics.getHeight()
    love.graphics.draw(self.icons.yarn, 8, height - 40, 0, 0.5, 0.5)
    love.graphics.print(' x ' .. InventoryManager:total("Yarn"), 40, height - 32)
end
