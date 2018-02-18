return {
    {
        function()
            if InventoryManager.count >= 5 then
                DialogScene.cursor = 5
            else
                DialogScene.cursor = 2
            end
        end
    },
    {
        "Oh! You're finally awake. Those guys really did a number on you, huh?",
    },
    {
        "... Look, I know you're angry, but we don't have to fight. We could always leave.",
    },
    {
        "I'm not saying we have to, but if you could find 5 yarn then I think we could escape this place.",
        function() Gamestate.pop() end
    },
    {
        "Wow! You got them!",
        function() Gamestate.switch(CreditsScene) end
    },
}
