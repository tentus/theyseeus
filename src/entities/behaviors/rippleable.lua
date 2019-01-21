Rippleable = Class{
    rippleColor = {
        1, 1, 1
    }
}

function Rippleable:addRipple()
    WorldScene:addEnt('Pickups', RippleEffect(self.x, self.y, self.rippleColor))
end
