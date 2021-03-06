local function firstTile(map)
    for _, layer in pairs(map.layers) do
        if layer.type == 'tilelayer' then
            for y=1, map.height do
                for x=1, map.width do
                    if layer.data[y][x] then return layer.data[y][x] end
                end
            end
        end
    end
end

BackgroundLayer = Class{
}

function BackgroundLayer:init(map)
    local tile = firstTile(map)

    if not tile then return end

    self.quad       = tile.quad
    self.tilewidth  = map.tilewidth
    self.tileheight = map.tileheight

    self.batch = love.graphics.newSpriteBatch(map.tilesets[tile.tileset].image, 10000)
    self:fillBatch()
end

function BackgroundLayer:draw(x, y)
    if self.batch then
        -- render offset by one tile, to avoid having a gap at the edge
        local tw, th = self.tilewidth, self.tileheight
        love.graphics.draw(self.batch, (x % tw) - tw, (y % th) - th)
    end
end

function BackgroundLayer:fillBatch()
    self.batch:clear()
    local w = math.ceil(love.graphics.getWidth() / self.tilewidth)
    local h = math.ceil(love.graphics.getHeight() / self.tileheight)
    for y=0, h do
        for x=0, w do
            self.batch:add(self.quad, x * self.tilewidth, y * self.tileheight)
        end
    end
end
