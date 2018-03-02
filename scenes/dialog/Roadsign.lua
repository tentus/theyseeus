return {
    {
        function()
            local c, h = RegionManager.cursor, RegionManager.home
            local a1, a2
            if c.y < h.y then
                a1 = "north"
            elseif c.y > h.y then
                a1 = "south"
            end
            if c.x < h.x then
                a2 = "east"
            elseif c.x > h.x then
                a2 = "west"
            end
            return "Welcome to the " .. (a1 or "") .. (a2 or "") .. " woodlands."
        end
    },
}
