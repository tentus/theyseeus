Damagable = Class{
    health = 1,
}

function Damagable:damage()
    self.health = self.health - 1

    if self.kill and self.health < 1 then
        self:kill()
    end
end
