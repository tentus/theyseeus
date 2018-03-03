InventoryManager = {
    -- which items have been collected (keyed by region coords)
    collected = {
    }
}

function InventoryManager:collect(thing)
    if not self.collected[thing] then
        self.collected[thing] = {}
    end
    local key = self:regionKey()
    self.collected[thing][key] = (self.collected[thing][key] or 0) + 1
    Logger:add(thing .. " Collected")
    return self:total(thing)
end

function InventoryManager:has(thing)
    return self.collected[thing] and (self.collected[thing][self:regionKey()] or 0) > 0
end

function InventoryManager:reset()
    for _, section in pairs(self.collected) do
        section = {}
    end
end

function InventoryManager:total(thing)
    local count = 0
    for _, v in pairs(self.collected[thing] or {}) do
        count = count + v
    end
    return count
end

function InventoryManager:regionKey()
    local c = RegionManager.cursor
    return c.x .. 'x' .. c.y
end
