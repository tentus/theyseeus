-- implements the ":getTargetPosition()" pseudo interface

SpawnPoint = Class{
    classname = 'SpawnPoint',
    x = 0,
    y = 0,
}

function SpawnPoint:init(x, y)
    self.x = x
    self.y = y
end

function SpawnPoint:getTargetPosition()
    return self.x, self.y
end
