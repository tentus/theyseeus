Killable = Class{
    dead = false
}

function Killable:kill()
    self.dead = true
end
