-- Manage the day/night cycle of the world
DaylightManager = {
    -- these times are measured in seconds
    current = 60,
    duration = 120,

    -- adjust the overall speed of the cycle
    multiplier = 1,

    -- color settings (0 - 1)
    intensity = 1,
    alpha = 0.5,
}

function DaylightManager:update(dt)
    -- todo: devise a clean way to skew the day/night ratio
    self.current = (self.current + (dt * self.multiplier)) % self.duration
end

function DaylightManager:draw()
    local reset = {love.graphics.getColor()}

    local darkness = self:darkness()
    local color = darkness * self.intensity
    love.graphics.setColor(
            self.intensity - color,
            self.intensity - color,
            color - self.intensity,
            self.alpha * (darkness + 0.1)       -- effect decreases closer to noon
    )

    local width, height = love.window.getMode()
    love.graphics.rectangle("fill", 0, 0, width, height)

    love.graphics.setColor(reset)
end

-- get the current "darkness" factor from 0 (noon) to 1 (midnight)
function DaylightManager:darkness()
    local midday = (self.duration / 2)
    return math.abs((self.current - midday) / midday)
end

function DaylightManager:isNight()
    return (self.current < (self.duration * 0.25)) or (self.current > (self.duration * 0.75))
end
