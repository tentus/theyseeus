AudioManager = {
    cache = {},
    volume = {
        master = 1,
        music  = 1,
        sfx    = 1,
    },
    --streaming: Source,
}

function AudioManager:play(file)
    if not self.cache[file] then
        self.cache[file] = love.audio.newSource(file, "static")
    end
    self.cache[file]:setVolume(self.volume.sfx)
    love.audio.play(self.cache[file])
end

function AudioManager:stream(file)
    self.streaming = love.audio.newSource(file, "stream")
    self.streaming:setLooping(true)
    love.audio.play(self.streaming)
end

function AudioManager:changeVolume(target, increment)
    local v = math.min(self.volume[target] + increment, 1)
    self.volume[target] = v < 0 and 1 or v
    love.audio.setVolume(self.volume.master)

    if self.streaming then
        self.streaming:setVolume(self.volume.music)
    end
end

function AudioManager:getVolume(target)
    return math.floor(self.volume[target] * 100)
end
