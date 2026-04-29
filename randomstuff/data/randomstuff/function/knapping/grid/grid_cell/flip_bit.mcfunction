$data modify entity @s data.grid[$(row)][$(col)] set value 0b
scoreboard players add @s rs.knapping.grid.flips 1
execute if score @s rs.knapping.grid.flips matches 25.. run \
    function randomstuff:knapping/grid/cleanup with storage randomstuff:knapping.grid.temp.idx
execute unless score @s rs.knapping.grid.flips matches 25.. run \
    function randomstuff:knapping/grid/update_storage