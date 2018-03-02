RegionManager = {
    -- a list of all production-read maps
    whitelist = {
        1, 2, 3, 4, 5
    },

    -- how many of each pickup we want to create
    pickups = {
        Yarn = 10,
        Upgrade = 6,
        Map = 2,
        Gem = 4,
        Horn = 1,
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

    -- the point of origin is always the same
    self.data[self.home.y][self.home.x].chosen = 'home'
    self:markVisited()
end

function RegionManager:draw()
    local mapsFound = InventoryManager:total("Map")
    if mapsFound == 0 then return end

    local function cellText(cell, gemsFound)
        local text = cell.chosen

        local list = {"Yarn", "Upgrade", "Map", "Horn"}
        for i=1, math.min(gemsFound, #list) do
            if cell[list[i]] then
                text = text .. list[i]:sub(1,1)
            end
        end

        if x == self.cursor.x and y == self.cursor.y then
            text = '[' .. text .. ']'
        end

        return text
    end

    local w, h = 56, 32
    local tr = love.graphics.getWidth() - ((self.width + 2) * w)
    local spacing = 8
    local gemsFound = InventoryManager:total("Gem")
    for y=1, self.height do
        for x=1, self.width do
            local cell = self.data[y][x]
            if cell.visited or mapsFound > 1 then
                local text = cellText(cell, gemsFound)
                local opacity = (x == self.cursor.x and y == self.cursor.y) and 192 or 128

                love.graphics.setColor(0, (cell.visited and 96 or 0), 0, opacity)
                love.graphics.rectangle('fill', (x * w) + tr, (y * h), w - spacing, h - spacing)

                love.graphics.setColor(255, 255, 255)
                love.graphics.printf(text, (x * w) + tr - (spacing / 2), (y * h) + (spacing / 2), w, "center")
            end
        end
    end
end

function RegionManager:warpHome()
    self.cursor.x = self.home.x
    self.cursor.y = self.home.y
end

function RegionManager:coords()
    return self.cursor.x, self.cursor.y
end

function RegionManager:currentCell()
    return self.data[self.cursor.y][self.cursor.x]
end

function RegionManager:move(x, y)
    local within = function(val, delta, max)
        val = (val + delta) % max
        return (val < 1) and max or val
    end
    self.cursor.x = within(self.cursor.x, x, self.width)
    self.cursor.y = within(self.cursor.y, y, self.height)
    self:markVisited()
end

function RegionManager:markVisited()
    self:currentCell().visited = true
end

function RegionManager:chooseRandom()
    local x, y = love.math.random(self.width), love.math.random(self.height)
    if x == self.home.x and y == self.home.y then
        return self:chooseRandom()
    end
    return self.data[y][x]
end
