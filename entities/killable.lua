Killable = Class{
    dead = false,
    death_audio = love.audio.newSource("assets/audio/die.ogg", "static"),
}

function Killable:kill()
    self.dead = true
    self.death_audio:play()
end
