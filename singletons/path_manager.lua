local Grid       = require "libraries.jumper.grid"
local Pathfinder = require "libraries.jumper.pathfinder"

PathManager = Class{
    tilewidth = 0,
    tileheight = 0,

    -- the pathfinder instance
    finder = nil;

    -- configurations
    walkable = 0,
    filled = 1,
}

function PathManager:init(map)
    self.tilewidth = map.tilewidth
    self.tileheight = map.tileheight

    -- first, fill up a temp grid with walkable
    -- assumption: no AI is going to try to walk outside the perimeter of the map
    local temp = {}
    for y = 1, map.height do
        temp[y] = {}
        for x = 1, map.width do
            temp[y][x] = self.walkable
        end
    end

    -- iterate through each collidable layer, and collectively set their tiles as non-walkable
    for _, layer in pairs(map.layers) do
        if layer.type == "tilelayer" and layer.properties.collidable == true then
            -- sti organizes the data as rows
            for y, tiles in pairs(layer.data) do
                for x, _ in pairs(tiles) do
                    temp[y][x] = self.filled
                end
            end
        end
    end

    -- copy the grid over, expanding each filled cell as we go
    local grid = Grid(temp)

    self.finder = Pathfinder(grid, 'ASTAR', self.walkable)
    self.finder:setMode('ORTHOGONAL')
end

function PathManager:getNextPathNode(startX, startY, endX, endY)
    -- if we can't find a route, default to staying in place
    local node = {x = startX, y = startY}

    -- we're expecting the inputs to be in physics units, which we convert to tile coords
    local path, pathLength = self.finder:getPath(
        math.floor(startX / self.tilewidth) + 1,
        math.floor(startY / self.tileheight) + 1,
        math.floor(endX / self.tilewidth) + 1,
        math.floor(endY / self.tileheight) + 1
    )

    if pathLength > 1 then
        local last = self:lastNodeInSight(path)
        node.x = (last.x * self.tilewidth) - (self.tilewidth / 2)
        node.y = (last.y * self.tileheight) - (self.tileheight / 2)
    end

    return node, pathLength
end

function PathManager:lastNodeInSight(path)
    -- if the first two nodes have the same x values, look for the first change in x values
    local lookat = (path[1].x == path[2].x) and "x" or "y"
    for node, count in path:iter() do
        if (node[lookat] ~= path[1][lookat]) then
            return path[count - 1]
        end
    end

    -- the whole path is one long line, so go with the final node
    return path[#path]
end
