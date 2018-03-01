Killable = Class{
    dead = false,
    death_audio = "assets/audio/die.ogg",
}

function Killable:kill()
    self.dead = true
    if self.death_audio then
        AudioManager:play(self.death_audio)
    end
end
