Yarn = Class{
    __includes = Killable,
    classname = 'Yarn',
    radius = 32,
    sprite = {
        image = love.graphics.newImage("assets/sprites/yarn.png"),
    },
    glow = GlowEffect(),
}

function Yarn:init(x, y, world)
    -- set offsets for image drawing, since it won't change
    self.sprite.x = self.sprite.image:getWidth() / 2
    self.sprite.y = self.sprite.image:getHeight() / 2

    self:createBody(world, x, y)
end

function Yarn:draw()
    local x, y = self.body:getPosition()
    self.glow:draw(x, y)
    love.graphics.draw(self.sprite.image, x - self.sprite.x, y - self.sprite.y)
end

function Yarn:update(dt)
    self.glow:update(dt)
end

function Yarn:createBody(world, x, y)
    self.body = love.physics.newBody(world, x or 0, y or 0, "static")

    self.shape   = love.physics.newCircleShape(self.radius)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setSensor(true)
    self.fixture:setUserData(self)
end

function Yarn:beginContact(other)
    if other.classname == "Player" then
        InventoryManager:collectYarn(RegionManager:coords())
        self.body:destroy()
        self:kill()
    end
end
