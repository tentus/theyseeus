Killable = Class{
    dead = false,
}

function Killable:kill()
    self.dead = true
    if self.death_audio then
        AudioManager:play(self.death_audio)
    end
end
