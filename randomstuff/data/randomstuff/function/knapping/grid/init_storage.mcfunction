# NOTE: tmp nbt values for bee to not move
data modify entity @s NoAI set value 1b
data modify entity @s NoGravity set value 1b
data modify entity @s Invulnerable set value 1b

# storage to check if we destroyed all the grid cells
# if reached 25, we destroy the storage
data modify entity @s data.flips set value 0

tag @s add randomstuff
tag @s add knapping
# TODO: Swap for a proper tag lol
tag @s add grid_bee

data modify entity @s data set value {\
    grid:[\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
    ],\
}
scoreboard players operation @s rs.knapping.grid.g_id = \
    #knapping rs.knapping.grid.temp.g_id
scoreboard players set @s rs.knapping.grid.flips 0