WeatherManager = {
    -- chances are expressed in "1 in X", eg "1 in 10" == 10%
    effects = {
        rain = {
            chance = 10,
            image = love.graphics.newImage("assets/sprites/effects/rain.png"),
            init = function(rain)
                rain.particles = love.graphics.newParticleSystem(rain.image)
                rain.particles:setEmissionRate(200)
                rain.particles:setParticleLifetime(5)
                rain.particles:setLinearAcceleration(-200, 400, -300, 600)
                rain.particles:setPosition(1024, -128)
                rain.particles:setAreaSpread("normal",2048,0)
                rain.particles:start()
            end,
        },
        -- todo: cloudy
    },
}

function WeatherManager:update(dt)
    for _, weather in pairs(self.effects) do
        if weather.enabled then
            weather.particles:update(dt)
        end
    end
end

function WeatherManager:draw()
    for _, weather in pairs(self.effects) do
        if weather.enabled then
            love.graphics.draw(weather.particles)
        end
    end
end

function WeatherManager:reroll()
    for _, weather in pairs(self.effects) do
        weather.enabled = love.math.random(weather.chance) == 1
        if weather.enabled and not weather.particles then
            weather.init(weather)
        end
    end
end
