DialogScene = {
    cursor = 1,
    dialog = {},
    dialogFont = love.graphics.newFont(12),   -- the default
    hint = "Press space to continue.  ",
    hintFont = love.graphics.newFont(10),
    height = 64,
}

function DialogScene:enter(from, dialogFile)
    self.from = from -- record previous state

    self.cursor = 1
    self.dialog = require("scenes.dialog." .. dialogFile)

    -- the first entry could be a dialog branch, so run it before we get start drawing
    -- if it's just text then no harm no foul
    self:getCurrent()
end

function DialogScene:draw()
    -- draw underlying screen
    self.from:draw()

    local width, height = love.window.getMode()

    love.graphics.setColor(0, 0, 0, 224)
    love.graphics.rectangle("fill", 0, height - self.height, width, self.height)

    love.graphics.setColor(192, 192, 192)
    love.graphics.setFont(self.hintFont)
    love.graphics.printf(self.hint, 8, height - 16, width - 16, "right")

    love.graphics.setColor(255, 255, 255)
    love.graphics.setFont(self.dialogFont)
    love.graphics.printf(self:getCurrent(), 8, height - self.height + 4, width - 16, "left")
end

function DialogScene:keypressed(key)
    if key == "return" or key == "space" or key == "tab" then
        self:proceed()
    end
end

function DialogScene:getCurrent()
    -- get the current text, after executing if needed
    local current = self.dialog[self.cursor][1]
    if type(current) == "function" then
        return current()
    end
    return current
end

function DialogScene:proceed()
    -- a second entry in the current subtable is used as a handler for how to proceed
    -- otherwise we just bump up the cursor, if there's anything left to say
    if self.dialog[self.cursor][2] then
        self.dialog[self.cursor][2]()
    elseif self.cursor < #self.dialog then
        self.cursor = self.cursor + 1
    else
        Gamestate.pop()
    end
end

