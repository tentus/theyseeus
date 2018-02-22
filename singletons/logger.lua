Logger = {
    events = {
        -- holds a list of events and their counts, eg:
        Deaths = 0,
        Playtime = 0,
    }
}

function Logger:add(event, value)
    self.events[event] = (self.events[event] or 0) + (value or 1)
end

function Logger:print()
    local str = ""
    for k, v in pairs(self.events) do
        str = str .. k .. "  :  " .. math.floor(v) .. "\n\n"
    end
    return str
end
