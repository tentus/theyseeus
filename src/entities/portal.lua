Portal = Class{
    __includes = {Explicable, Sensable},
    classname = 'Portal',
    sprite = SpriteComponent('assets/sprites/portal.png'),
    activated = false,
    explanationDialog = 'AboutPortals',
    radius = 64,
    pulse = 0,
    pulseRate = 4,
}

function Portal:init(x, y, destination)
    Sensable.init(self, x, y)
    self.activated = InventoryManager:has(self.classname)
end

function Portal:update(dt)
    Sensable.update(self, dt)
    self.pulse = self.pulse + (dt / self.pulseRate)
end

function Portal:draw()
    -- inactive portals are half-opacity, while active ones pulse to full opacity
    local alpha = 128
    if self.activated then
        alpha = alpha + (math.abs((self.pulse % 1) - 0.5) * 255)
    end
    love.graphics.setColor(255, 255, 255, alpha)
    self.sprite:draw(self.x, self.y)
    love.graphics.setColor(255, 255, 255)
end

function Portal:playerSensed(player)
    -- mark the portal as collected, for future use
    if not self.activated then
        InventoryManager:collect(self.classname)
        self.activated = true
        self:explain()
    end

    -- and if we have activated another portal, let's goooo
    if InventoryManager:total(self.classname) > 1 then
        local next = Portal:next()
        RegionManager:warpTo(next.x, next.y)

        -- note: we can't just load the region directly, because we're in the middle of the update loop
        -- instead we queue the transition up and let it happen normally
        WorldScene:startTransition('Portal')
    end
end

function Portal:next()
    local list = InventoryManager:list(self.classname)
    for _, v in pairs(list) do
        if v.y > RegionManager.cursor.y then
            return v
        end
    end
    return list[1]
end