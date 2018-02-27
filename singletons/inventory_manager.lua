InventoryManager = {
    -- which items have been collected (keyed by region coords)
    collected = {
    }
}

function InventoryManager:collect(thing)
    if not self.collected[thing] then
        self.collected[thing] = {}
    end
    self.collected[thing][self:key(RegionManager:coords())] = true
    Logger:add(thing .. " Collected")
    return self:total(thing)
end

function InventoryManager:has(thing, regionX, regionY)
    return self.collected[thing] and self.collected[thing][self:key(regionX, regionY)] == true
end

function InventoryManager:reset()
    for _, section in pairs(self.collected) do
        section = {}
    end
end

function InventoryManager:total(thing)
    local count = 0
    for _ in pairs(self.collected[thing] or {}) do count = count + 1 end
    return count
end

function InventoryManager:key(...)
    return table.concat(arg, 'x')
end
