Player = Class{
    __includes = Minotaur,
    defaultForce = 10000,
    currentForce = 10000,
    maxForce = 20000,
    isCharging = false,
    facingX = 0,
    facingY = 0
}

function Player:update(dt)
    local kd = love.keyboard.isDown
    local x, y = 0, 0

    -- note the separate ifs: if you press opposing keys they'll cancel out
    if kd("a") or kd("left")  then x = x - 1 end
    if kd("d") or kd("right") then x = x + 1 end
    if kd("w") or kd("up")    then y = y - 1 end
    if kd("s") or kd("down")  then y = y + 1 end

    if self.isCharging then
      if self.currentForce < self.maxForce then self.currentForce = self.currentForce + 100 end
      self.body:applyForce(self.facingX * self.currentForce, self.facingY * self.currentForce)
    end
    if not self.isCharging then
      self.currentForce = self.defaultForce
      self.body:applyForce(x * self.currentForce, y * self.currentForce)
    end

    function love.keypressed(key, scancode, isrepeat)

      if key == "space" then
      self.isCharging = not self.isCharging

      if self.isCharging then self.body:setLinearDamping(1) end
      if not self.isCharging then self.currentForce = self.defaultForce self.body:setLinearDamping(8) end

      end

      if key == "up" or key == "w" then self.facingX = 0 self.facingY = -1 end
      if key == "down" or key == "s" then self.facingX = 0 self.facingY = 1 end
      if key == "left" or key == "a" then self.facingX = -1 self.facingY = 0 end
      if key == "right" or key == "d" then self.facingX = 1 self.facingY = 0 end

    end

end
