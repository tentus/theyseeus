local Grid       = require 'libraries.jumper.grid'
local Pathfinder = require 'libraries.jumper.pathfinder'

local lastNodeInSight = function(path)
    -- if the first two nodes have the same x values, look for the first change in x values
    local lookat = (path[1].x == path[2].x) and 'x' or 'y'
    for node, count in path:iter() do
        if (node[lookat] ~= path[1][lookat]) then
            return path[count - 1]
        end
    end

    -- the whole path is one long line, so go with the final node
    return path[#path]
end

PathManager = Class{
    tilewidth = 0,
    tileheight = 0,

    -- a collision map of walkable/filled tiles and ents
    tiles = {},
    ents = {},

    -- the pathfinder instance
    finder = nil;

    -- configurations
    walkable = 0,
    filled = 1,
}

function PathManager:init(map)
    self.map = map

    self.tilewidth = map.tilewidth
    self.tileheight = map.tileheight

    -- first, fill up a temp grid with walkable
    -- assumption: no AI is going to try to walk outside the perimeter of the map
    self:tileCollisions()
    self:entCollisions()

    self:build()
end

-- for debugging
function PathManager:draw(tx, ty)
    for y = 1, self.map.height do
        for x = 1, self.map.width do
            love.graphics.print(
                self.tiles[y][x] .. ' / ' .. self.ents[y][x],
                tx + (x - 1) * self.map.tilewidth,
                ty + (y - 1) * self.map.tileheight
            )
        end
    end
end

function PathManager:build()
    local merged = self:blank(function(x, y)
        return (self.tiles[y][x] == self.filled or self.ents[y][x] == self.filled) and self.filled or self.walkable
    end)

    local grid = Grid(merged)

    self.finder = Pathfinder(grid, 'ASTAR', self.walkable)
    self.finder:setMode('ORTHOGONAL')
end

function PathManager:blank(filler)
    filler = filler or function() return self.walkable end
    local temp = {}
    for y = 1, self.map.height do
        temp[y] = {}
        for x = 1, self.map.width do
            temp[y][x] = filler(x, y)
        end
    end
    return temp
end

function PathManager:tileCollisions()
    self.tiles = self:blank()

    -- iterate through each collidable layer, and collectively set their tiles as non-walkable
    for _, layer in pairs(self.map.layers) do
        if layer.type == 'tilelayer' and layer.properties.collidable == true then
            -- sti organizes the data as rows
            for y, tiles in pairs(layer.data) do
                for x, _ in pairs(tiles) do
                    self.tiles[y][x] = self.filled
                end
            end
        end
    end

    return self
end

function PathManager:entCollisions()
    self.ents = self:blank()

    for _, layer in pairs(self.map.layers) do
        for _, ent in pairs(layer.ents or {}) do
            for _, coords in pairs(ent.fillsGrid and ent:fillsGrid() or {}) do
                local x, y = self:convertCoords(unpack(coords))

                self.ents[y][x] = self.filled
            end
        end
    end

    return self
end

function PathManager:convertCoords(x, y)
    return math.floor(x / self.tilewidth) + 1,
        math.floor(y / self.tileheight) + 1
end

function PathManager:getNextPathNode(startX, startY, endX, endY)
    -- if we can't find a route, default to staying in place
    local node = {x = startX, y = startY}

    -- we're expecting the inputs to be in physics units, which we convert to tile coords
    local a, b = self:convertCoords(startX, startY)
    local c, d = self:convertCoords(endX, endY)
    local path, pathLength = self.finder:getPath(a, b, c, d)

    if pathLength > 0 then
        local last = lastNodeInSight(path)
        node.x = (last.x * self.tilewidth) - (self.tilewidth / 2)
        node.y = (last.y * self.tileheight) - (self.tileheight / 2)
    end

    return node, pathLength
end
