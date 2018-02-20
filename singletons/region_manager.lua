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
            self.chosen[y][x] = self.whitelist[love.math.random(#self.whitelist)]
        end
    end

    -- the point of origin is always the same
    self.chosen[self.y][self.x] = 'home'
end

function RegionManager:draw()
    local w, h = 56, 32
    local tr = love.graphics.getWidth() - ((self.width + 2) * w)
    local spacing = 8
    for y=1, self.height do
        for x=1, self.width do
            local text = self.chosen[y][x]
            local opacity = 128
            if x == self.x and y == self.y then
                text = '[' .. text .. ']'
                opacity = 192
            end

            love.graphics.setColor(0, 0, 0, opacity)
            love.graphics.rectangle('fill', (x * w) + tr, (y * h), w - spacing, h - spacing)

            love.graphics.setColor(255, 255, 255)
            love.graphics.printf(text, (x * w) + tr - (spacing / 2), (y * h) + (spacing / 2), w, "center")
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

function RegionManager:move(x, y)
    self.x = (self.x + x) % self.width
    if self.x < 1 then
        self.x = self.width
    end

    self.y = (self.y + y) % self.height
    if self.y < 1 then
        self.y = self.height
    end
end
