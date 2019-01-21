Upgrade = Class{
    __includes = {BaseCollectible},
    classname = 'Upgrade',
    sprite = SpriteComponent('assets/sprites/items/upgrade.png'),
    explanationDialog = 'AboutUpgrades',
    rippleColor = {0.5, 1, 0.5},
}

function Upgrade:playerSensed(player)
    player:incrementHealth()
    BaseCollectible.playerSensed(self)
end
