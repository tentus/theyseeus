InventoryManager = {
    -- which yarns have been collected (keyed by region coords)
    yarn = {},

    -- overall count of yarns, for easier reference
    count = 0,
}

function InventoryManager:draw()
    love.graphics.print('Yarns Collected: ' .. self.count)
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
