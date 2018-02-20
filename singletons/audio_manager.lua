AudioManager = {
    cache = {},
    volume = 100,
    --streaming: Source,
}

function AudioManager:play(file)
    if not self.cache[file] then
        self.cache[file] = love.audio.newSource(file, "static")
    end
    love.audio.play(self.cache[file])
end

function AudioManager:stream(file)
    self.streaming = love.audio.newSource(file, "stream")
    self.streaming:setLooping(true)
    love.audio.play(self.streaming)
end

function AudioManager:changeVolume(increment)
    -- adjust the volume, staying inside 100
    self.volume = self.volume + increment
    if self.volume > 100 then
        self.volume = 0
    elseif self.volume < 0 then
        self.volume = 100
    end

    if self.streaming then
        self.streaming:setVolume(self.volume / 100)
    end
end
