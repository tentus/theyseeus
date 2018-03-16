return {
    {
        'Wow! You got them!',
        function()
            WorldScene:init()
            InventoryManager.collected  = {}
            Gamestate.pop()
            Gamestate.switch(CreditsScene)
        end
    },
}
