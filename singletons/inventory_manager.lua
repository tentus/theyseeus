InventoryManager = {
    -- which yarns have been collected (keyed by region coords)
    yarn = {},

    -- overall count of yarns, for easier reference
    count = 0,
    image = love.graphics.newImage("assets/sprites/yarn.png"),
    font = love.graphics.newFont(16),
}

function InventoryManager:draw()
    local height = love.graphics.getHeight()
    local reset = love.graphics.getFont()

    love.graphics.draw(self.image, 8, height - 40, 0, 0.5, 0.5)

    love.graphics.setFont(self.font)
    love.graphics.print(' x ' .. self.count, 40, height - 32)
    love.graphics.setFont(reset)
end

function InventoryManager:collectYarn(regionX, regionY)
    if not self:hasYarn(regionX, regionY) then
        self.yarn[regionX .. 'x' .. regionY] = true
        self.count = self.count + 1
    end
end

function InventoryManager:hasYarn(regionX, regionY)
    return self.yarn[regionX .. 'x' .. regionY] == true
end
