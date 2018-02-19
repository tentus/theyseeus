Upgrade = Class{
    __includes = {Interactable, Killable},
    classname = 'Upgrade',
    radius = 32,
    sprite = {
        image = love.graphics.newImage("assets/sprites/upgrade.png"),
    },
    glow = GlowEffect(),
    death_audio = love.audio.newSource("assets/audio/collect.ogg", "static"),
}

function Upgrade:init(x, y, world)
    -- set offsets for image drawing, since it won't change
    self.sprite.x = self.sprite.image:getWidth() / 2
    self.sprite.y = self.sprite.image:getHeight() / 2

    self:createBody(world, x, y)
end

function Upgrade:draw()
    local x, y = self.body:getPosition()
    self.glow:draw(x, y)
    love.graphics.draw(self.sprite.image, x - self.sprite.x, y - self.sprite.y)
end

function Upgrade:update(dt)
    self.glow:update(dt)
end

function Upgrade:createBody(world, x, y)
    self.body = love.physics.newBody(world, x or 0, y or 0, "static")

    self.shape   = love.physics.newCircleShape(self.radius)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setSensor(true)
    self.fixture:setUserData(self)
end

function Upgrade:playerContact(other)
    InventoryManager:collectUpgrade(RegionManager:coords())
    other:incrementHealth()
    self:kill()
end
