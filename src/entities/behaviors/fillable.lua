-- entities which fill the grid should implement this
Fillable = Class{
}

-- returns a table of coord pairs
-- we assume that most implementations of this will have a body occupying a single tile
function Fillable:fillsGrid()
    return {{self:bodyPosition()}}
end
