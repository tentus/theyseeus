Magnet = Class{
    __includes = {BaseCollectible},
    classname = 'Magnet',
    sprite = SpriteComponent('assets/sprites/items/magnet.png'),
    explanationDialog = 'AboutMagnets',
    rippleColor = {255, 128, 255},
    gain = 24,
}

function Magnet:playerSensed(player)
    player.magnetRange = player.magnetRange + self.gain
    BaseCollectible.playerSensed(self)
end