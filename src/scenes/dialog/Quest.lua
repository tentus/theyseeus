return {
    {
        function()
            if InventoryManager:total(Yarn.classname) >= 5 then
                DialogScene.cursor = 5
            else
                DialogScene.cursor = 2
            end
        end
    },
    {
        'Oh! You\'re finally awake. Those guys really did a number on you, huh?',
    },
    {
        '... Look, I get it, but we can\'t fight these guys. We need to leave.',
    },
    {
        'If you can find 5 yarn then I think we can escape the maze.',
        function() Gamestate.pop() end
    },
    {
        'Wow! You got them!',
        function()
            InventoryManager:reset()
            Player:kill()
            Gamestate.switch(CreditsScene)
        end
    },
}
