InventoryManager = {
    -- which yarns have been collected (keyed by region coords)
    yarn = {},

    -- which upgrades have been collected
    upgrades = {},

    image = love.graphics.newImage("assets/sprites/yarn.png"),
    font = love.graphics.newFont(16),
}

function InventoryManager:draw()
    local height = love.graphics.getHeight()
    local reset = love.graphics.getFont()

    love.graphics.draw(self.image, 8, height - 40, 0, 0.5, 0.5)

    love.graphics.setFont(self.font)
    love.graphics.print(' x ' .. self:totalYarn(), 40, height - 32)
    love.graphics.setFont(reset)
end

function InventoryManager:collectYarn(regionX, regionY)
    self.yarn[regionX .. 'x' .. regionY] = true
end

function InventoryManager:hasYarn(regionX, regionY)
    return self.yarn[regionX .. 'x' .. regionY] == true
end

function InventoryManager:collectUpgrade(regionX, regionY)
    self.upgrades[regionX .. 'x' .. regionY] = true
end

function InventoryManager:hasUpgrade(regionX, regionY)
    return self.yarn[regionX .. 'x' .. regionY] == true
end

function InventoryManager:reset()
    self.yarn = {}
    self.upgrades = {}
end

function InventoryManager:totalYarn()
    local count = 0
    for _ in pairs(self.yarn) do count = count + 1 end
    return count
end
