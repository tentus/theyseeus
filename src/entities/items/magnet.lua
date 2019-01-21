Magnet = Class{
    __includes = {BaseCollectible},
    classname = 'Magnet',
    sprite = SpriteComponent('assets/sprites/items/magnet.png'),
    explanationDialog = 'AboutMagnets',
    rippleColor = {1, 0.5, 1},
    gain = 24,
}

function Magnet:playerSensed(player)
    player.magnetRange = player.magnetRange + self.gain
    BaseCollectible.playerSensed(self)
end