FPS = {
    show = true,
}

function FPS:toggle()
    self.show = not self.show
end

function FPS:draw()
    if self.show then
        local width, height = love.window.getMode()
        love.graphics.printf(love.timer.getFPS(), width - 48, height - 28, 40, "right")
    end
end
