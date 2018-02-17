RegionManager = {
    -- a list of all production-read maps
    whitelist = {
        1, 2, 3
    },

    -- current overall position in the region grid
    x = 1,
    y = 1,

    -- how big a grid we'll generate
    width = 5,
    height = 5,

    -- the arrangement of regions, set during init
    chosen = {},
}

function RegionManager:init()
    for y=1, self.height do
        self.chosen[y] = {}
        for x=1, self.width do
            self.chosen[y][x] = self.whitelist[math.random(#self.whitelist)]
        end
    end

    -- the point of origin is always the same
    self.chosen[self.y][self.x] = self.whitelist[1]
end

function RegionManager:draw()
    local size = 32
    for y=1, self.height do
        for x=1, self.width do
            local text = self.chosen[y][x]
            if x == self.x and y == self.y then
                text = '[' .. text .. ']'
            end

            love.graphics.setColor(0, 0, 0, 128)
            love.graphics.rectangle('fill', (x * size) + 4, (y * size) - 4, 24, 24)

            love.graphics.setColor(255, 255, 255)
            love.graphics.printf(text, x * size, y * size, size, "center")
        end
    end
end

function RegionManager:current()
    return self.chosen[self.y][self.x]
end

function RegionManager:moveHorizontal(x)
    self.x = (self.x + x) % self.width
    if self.x < 1 then
        self.x = self.width
    end
end

function RegionManager:moveVertical(y)
    self.y = (self.y + y) % self.height
    if self.y < 1 then
        self.y = self.height
    end
end
