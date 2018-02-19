RegionManager = {
    -- a list of all production-read maps
    whitelist = {
        1, 2, 3, 4
    },

    -- current overall position in the region grid
    x = 3,
    y = 3,

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
    self.chosen[self.y][self.x] = 'home'
end

function RegionManager:draw()
    local w, h = 48, 32
    for y=1, self.height do
        for x=1, self.width do
            local text = self.chosen[y][x]
            local opacity = 128
            if x == self.x and y == self.y then
                text = '[' .. text .. ']'
                opacity = 192
            end

            love.graphics.setColor(0, 0, 0, opacity)
            love.graphics.rectangle('fill', (x * w) + 4, (y * h) - 4, w - 8, h - 8)

            love.graphics.setColor(255, 255, 255)
            love.graphics.printf(text, x * w, y * h, w, "center")
        end
    end
end

function RegionManager:warpHome()
    self.x = 3
    self.y = 3
end

function RegionManager:coords()
    return self.x, self.y
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
