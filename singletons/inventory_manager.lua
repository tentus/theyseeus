InventoryManager = {
    -- which yarns have been collected (keyed by region coords)
    yarn = {},

    -- which upgrades have been collected
    upgrades = {},
}

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
