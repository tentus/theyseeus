Explicable = Class{
    --explanationDialog = '',
}

function Explicable:explain()
    if self.explanationDialog and self:shouldExplain() then
        Gamestate.push(DialogScene, self.explanationDialog)
    end
end

-- separated for easier overriding
function Explicable:shouldExplain()
    return InventoryManager:total(self.classname) == 1
end
