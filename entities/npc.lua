NPC = Class{
    __includes = Minotaur,
    classname = 'NPC',
    pathnode = {
        x = 0,
        y = 0,
    },
    force = 4000,
}

function NPC:update(dt)
    local x, y = self.body:getPosition()
    local px, py = WorldScene.player.body:getPosition()

    -- we recalc constantly because we're constantly catching up to our destination
    self.pathnode = WorldScene.pathManager:getNextPathNode(x, y, px, py)

    -- we don't apply force unless we're far enough from it to be worthwhile, to avoid jitter
    local threshold = 4
    local h, v = 0, 0
    if math.abs(self.pathnode.x - x) > threshold then
        if self.pathnode.x < x then h = -1 end
        if self.pathnode.x > x then h = 1 end
    end
    if math.abs(self.pathnode.y - y) > threshold then
        if self.pathnode.y < y then v = -1 end
        if self.pathnode.y > y then v = 1 end
    end
    self.body:applyForce(h * self.force, v * self.force)
end
