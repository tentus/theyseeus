local yarn = 5

return {
    {
        function()
            if InventoryManager:total(Yarn.classname) >= yarn then
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
        'If you can find ' .. yarn .. ' yarn then I think we can escape the maze.',
        function() Gamestate.pop() end
    },
    {
        'Wow! You got them!',
        function()
            WorldScene:init()
            InventoryManager.collected  = {}
            Gamestate.switch(CreditsScene)
        end
    },
}
