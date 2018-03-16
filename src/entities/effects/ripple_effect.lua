RippleEffect = Class{
    __includes = {Killable},
    classname = 'RippleEffect',

    scale = 0,      -- 0 to 1
    duration = 0.5,   -- in seconds
    image = love.graphics.newImage('assets/sprites/effects/ripple.png'),
}

function RippleEffect:init(x, y, rgb)
    self.rgba = rgb or {255,255,255} -- alpha will get set each draw
    self.x = x
    self.y = y
    self.ox = self.image:getWidth() / 2
    self.oy = self.image:getHeight() / 2
end

function RippleEffect:draw()
    self.rgba[4] = (1 - self.scale) * 255
    love.graphics.setColor(self.rgba)
    love.graphics.draw(
        self.image,
        self.x, self.y,
        1,
        self.scale, self.scale,
        self.ox, self.oy
    )
    love.graphics.setColor(255, 255, 255)
end

function RippleEffect:update(dt)
    self.scale = self.scale + (dt / self.duration)
    if self.scale > 1 then
        self:kill()
    end
end
