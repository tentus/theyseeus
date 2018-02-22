-- implements the ":getTargetPosition()" pseudo interface

NavPoint = Class{
    classname = 'NavPoint',
    x = 0,
    y = 0,
}

function NavPoint:init(x, y)
    self.x = x
    self.y = y
end

function NavPoint:getTargetPosition()
    return self.x, self.y
end
