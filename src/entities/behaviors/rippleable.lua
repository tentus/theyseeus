Rippleable = Class{
    rippleColor = {
        255, 255, 255
    }
}

function Rippleable:addRipple()
    WorldScene:addEnt('Pickups', RippleEffect(self.x, self.y, self.rippleColor))
end
