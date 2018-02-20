return {
    {
        function()
            local rx, ry = RegionManager:coords()
            local hx, hy = RegionManager.home.x, RegionManager.home.y
            local area
            if ry < hy then
                area = "north"
            elseif ry > hy then
                area = "south"
            end
            if rx < hx then
                area = area .. "east"
            elseif rx > hx then
                area = area .. "west"
            end
            return "Welcome to the " .. area .. " woodlands."
        end
    },
}
