RegionManager = {
    -- a list of all production-read maps
    whitelist = {
        1, 2, 3, 4, 5, 6, 7
    },

    -- how many of each pickup we want to create
    pickups = {
        Yarn = 10,
        Upgrade = 6,
        Map = 2,
        Gem = 4,
        Horn = 1,
    },

    -- the portals are at predetermined places, spread out as much as they can be, considering that the world wraps
    portals = {
        {x = 3, y = 3},
        {x = 2, y = 1},
        {x = 5, y = 2},
        {x = 1, y = 4},
        {x = 4, y = 5},
    },

    -- current overall position in the region grid
    cursor = {
        x = 3,
        y = 3,
    },

    -- where we warp back to
    home = {
        x = 3,
        y = 3
    },

    -- how big a grid we'll generate
    width = 5,
    height = 5,

    -- the arrangement of regions, set during init
    data = {},
}

function RegionManager:init()
    for y=1, self.height do
        self.data[y] = {}
        for x=1, self.width do
            self.data[y][x] = {
                chosen  = self.whitelist[love.math.random(#self.whitelist)],
                visited = false,
            }
        end
    end

    -- fill the map with pickups. note that we use Proper case here, for easier lookups in spawning
    for key, value in pairs(self.pickups) do
        local i=1
        while i <= value do
            local rand = self:chooseRandom()
            if not rand[key] then
                rand[key] = true
                i = i + 1
            end
        end
    end

    for _, value in pairs(self.portals) do
        self.data[value.y][value.x][Portal.classname] = true
    end

    -- the point of origin is always the same
    self.data[self.home.y][self.home.x].chosen = 'home'
    self:warpHome()
end

function RegionManager:draw()
    local mapsFound = InventoryManager:total(Map.classname)
    if mapsFound == 0 then return end

    local function cellText(cell, gemsFound)
        local text = cell.chosen

        local list = {Yarn.classname, Upgrade.classname, Map.classname, Horn.classname}
        for i=1, math.min(gemsFound, #list) do
            if cell[list[i]] then
                text = text .. list[i]:sub(1,1)
            end
        end

        return text
    end

    local w, h = 56, 32
    local spacing = 8
    local offset = ((self.width + 1) * w) - spacing
    local gemsFound = InventoryManager:total(Gem.classname)
    for y=1, self.height do
        local yPos = (y - 1) * h
        for x=1, self.width do
            local cell = self.data[y][x]
            if cell.visited or mapsFound > 1 then
                local xPos = (x * w) - offset
                local text = cellText(cell, gemsFound)
                local opacity = (x == self.cursor.x and y == self.cursor.y) and 192 or 128

                love.graphics.setColor(0, (cell.visited and 96 or 0), 0, opacity)
                love.graphics.rectangle('fill', xPos, yPos, w - spacing, h - spacing)

                love.graphics.setColor(255, 255, 255)
                love.graphics.printf(text, xPos - (spacing / 2), yPos + (spacing / 2), w, "center")
            end
        end
    end
end

function RegionManager:warpTo(x, y)
    self.cursor.x = x
    self.cursor.y = y
    self:currentCell().visited = true
end

function RegionManager:warpHome()
    self:warpTo(self.home.x, self.home.y)
end

function RegionManager:currentCell()
    return self.data[self.cursor.y][self.cursor.x]
end

function RegionManager:move(x, y)
    local within = function(val, delta, max)
        val = (val + delta) % max
        return (val < 1) and max or val
    end
    self:warpTo(
        within(self.cursor.x, x, self.width),
        within(self.cursor.y, y, self.height)
    )
end

function RegionManager:chooseRandom()
    local x, y = love.math.random(self.width), love.math.random(self.height)
    if x == self.home.x and y == self.home.y then
        return self:chooseRandom()
    end
    return self.data[y][x]
end
