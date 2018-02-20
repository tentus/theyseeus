AudioManager = {
    volume = 100,
}

function AudioManager:play(file)
    self.bgm = love.audio.newSource(file, "stream")
    self.bgm:setLooping(true)
    love.audio.play(self.bgm)
end

function AudioManager:changeVolume(increment)
    -- adjust the volume, staying inside 100
    self.volume = self.volume + increment
    if self.volume > 100 then
        self.volume = 0
    elseif self.volume < 0 then
        self.volume = 100
    end

    if self.bgm then
        self.bgm:setVolume(self.volume / 100)
    end
end
