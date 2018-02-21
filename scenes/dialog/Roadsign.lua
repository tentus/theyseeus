return {
    {
        function()
            local rx, ry = RegionManager:coords()
            local hx, hy = RegionManager.home.x, RegionManager.home.y
            local a1, a2
            if ry < hy then
                a1 = "north"
            elseif ry > hy then
                a1 = "south"
            end
            if rx < hx then
                a2 = "east"
            elseif rx > hx then
                a2 = "west"
            end
            return "Welcome to the " .. (a1 or "") .. (a2 or "") .. " woodlands."
        end
    },
}
