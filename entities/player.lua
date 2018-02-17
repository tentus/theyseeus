Player = Class{
    __includes = Minotaur,
    force = 5000,
}

function Player:update(dt)
    local kd = love.keyboard.isDown
    local x, y = 0, 0

    -- note the separate ifs: if you press opposing keys they'll cancel out
    if kd("a") or kd("left")  then x = x - 1 end
    if kd("d") or kd("right") then x = x + 1 end
    if kd("w") or kd("up")    then y = y - 1 end
    if kd("s") or kd("down")  then y = y + 1 end

    self.body:applyForce(x * self.force, y * self.force)
end
