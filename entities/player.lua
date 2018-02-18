Player = Class{
    __includes = Minotaur,
    defaultForce = 5000,
    currentForce = 5000,
    maxForce = 25000,
    acceleration = 9000,
}

function Player:update(dt)
    local kd = love.keyboard.isDown
    local x, y = 0, 0

    -- note the separate ifs: if you press opposing keys they'll cancel out
    if kd("a") or kd("left")  then x = x - 1 end
    if kd("d") or kd("right") then x = x + 1 end
    if kd("w") or kd("up")    then y = y - 1 end
    if kd("s") or kd("down")  then y = y + 1 end

    if (x ~= 0 or y ~= 0) and kd("space") then
        self.currentForce = math.min((self.currentForce + (dt * self.acceleration)), self.maxForce)
    else
        -- you loose your accumulated boost the moment you let off the gas
        -- this does not equate to losing your speed, since we're using applied forces
        self.currentForce = self.defaultForce
    end

    self.body:applyForce(x * self.currentForce, y * self.currentForce)
end
