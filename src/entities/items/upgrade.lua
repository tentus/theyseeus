Upgrade = Class{
    __includes = {BaseCollectible},
    classname = 'Upgrade',
    sprite = SpriteComponent('assets/sprites/items/upgrade.png'),
    explanationDialog = 'AboutUpgrades',
    rippleColor = {128, 255, 128},
}

function Upgrade:playerSensed(player)
    player:incrementHealth()
    BaseCollectible.playerSensed(self)
end
