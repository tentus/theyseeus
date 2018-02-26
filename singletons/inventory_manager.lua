InventoryManager = {
    -- which items have been collected (keyed by region coords)
    collected = {
        Yarn = {},
        Upgrade = {},
        Map = {},
        Gem = {},
    }
}

function InventoryManager:collect(thing, regionX, regionY)
    self.collected[thing][regionX .. 'x' .. regionY] = true
    Logger:add(thing .. " Collected")
    return self:total(thing)
end

function InventoryManager:has(thing, regionX, regionY)
    return self.collected[thing][regionX .. 'x' .. regionY] == true
end

function InventoryManager:reset()
    for _, section in pairs(self.collected) do
        section = {}
    end
end

function InventoryManager:total(thing)
    local count = 0
    for _ in pairs(self.collected[thing]) do count = count + 1 end
    return count
end
