Toll = Class{
    __includes = {Interactable, Killable, Physical},
    classname = 'Toll',
    layer = 'Misc',

    cost = 20,

    bodyType = 'static',

    -- our body the same dimensions as a normal tile
    width = 64,
    height = 64,
    sprite = SpriteComponent('assets/sprites/toll.png'),

    -- prevent npcs from trying to path through us
    fillsGrid = true,
}

function Toll:init(world, x, y)
    self:createBody(world, x, y)
end

function Toll:draw()
    local x, y = self:bodyPosition()
    self.sprite:draw(x, y)
end

function Toll:makeShape()
    return love.physics.newRectangleShape(self.width, self.height)
end

function Toll:kill()
    self.fillsGrid = false
    Killable.kill(self)
end

function Toll:playerContact()
    if self.cost > InventoryManager:total(Coin.classname) then
        Gamestate.push(DialogScene, 'InsufficientFunds')
    else
        -- though it's a little weird, we stop tolls from respawning by making them collectible
        InventoryManager:collect(self.classname)
        InventoryManager:spend(Coin.classname, self.cost)

        -- assume that paying one toll covers every toll in the region
        for _, ent in pairs(WorldScene:namedLayer(self.layer).ents) do
            if ent.classname == self.classname then
                ent:kill()
            end
        end

        WorldScene.pathManager = PathManager(WorldScene.map)
    end
end
