-- a shortcut property for things only the player can interact with
Interactable = Class{
}

function Interactable:playerContact(player)
    -- interface placeholder
end

function Interactable:beginContact(other)
    if other.classname == 'Player' then
        self:playerContact(other)
    end
end
