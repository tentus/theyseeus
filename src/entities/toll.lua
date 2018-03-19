Toll = Class{
    __includes = {Interactable, Killable, Physical},
    classname = 'Toll',
    layer = 'Misc',

    cost = 20,

    bodyType = 'static',

    image = love.graphics.newImage('assets/sprites/toll.png'),

    -- prevent npcs from trying to path through us
    fillsGrid = true,
}

function Toll:init(world, x, y, width, height)
    self.width = width
    self.height = height

    self.image:setWrap('repeat', 'repeat')
    local iw, ih = self.image:getDimensions()
    self.quad = love.graphics.newQuad(0, 0, self.width, self.height, iw, ih)

    self:createBody(world, x, y)
end

function Toll:draw()
    local x, y = self:bodyPosition()
    love.graphics.draw(self.image, self.quad, x, y)
end

function Toll:makeShape()
    -- tiled rects are made from the top-left, not the center, so we have to tweak the x & y
    return love.physics.newRectangleShape(self.width / 2, self.height / 2, self.width, self.height)
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

        WorldScene.pathManager:entCollisions():build()
    end
end
