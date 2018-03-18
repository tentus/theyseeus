local glue = 'x'
local function regionKey()
    local c = RegionManager.cursor
    return c.x .. glue .. c.y
end

InventoryManager = {
    -- which items have been collected (keyed by region coords)
    collected = {},

    -- which items (read: coins) have been used (also keyed by region)
    spent = {},
}

function InventoryManager:collect(thing, qty)
    if not self.collected[thing] then
        self.collected[thing] = {}
    end
    local key = regionKey()
    self.collected[thing][key] = (self.collected[thing][key] or 0) + (qty or 1)
    Logger:add(thing .. ' Collected')
end

function InventoryManager:spend(thing, qty)
    -- todo
end

function InventoryManager:has(thing)
    return self.collected[thing] and (self.collected[thing][regionKey()] or 0) > 0
end

function InventoryManager:total(thing)
    local total = 0
    for _, v in pairs(self.collected[thing] or {}) do
        total = total + v
    end
    for _, v in pairs(self.spent[thing] or {}) do
        total = total - v
    end
    return total
end

function InventoryManager:list(thing)
    local list = {}
    for k, _ in pairs(self.collected[thing] or {}) do
        local x, y = k:match('(%d+)' .. glue .. '(%d+)')
        table.insert(list, {
            x = tonumber(x),
            y = tonumber(y),
        })
    end
    table.sort(list, function (a, b)
        return a.y < b.y
    end)
    return list
end
