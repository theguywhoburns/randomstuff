# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# NOTE: assumes the execution is done as the interaction entity in the grid
execute store result storage randomstuff:knapping.grid temp.idx.g_id int 1 run scoreboard players get @s rs.knapping.grid.g_id
execute store result storage randomstuff:knapping.grid temp.idx.row int 1 run scoreboard players get @s rs.knapping.grid.row
execute store result storage randomstuff:knapping.grid temp.idx.col int 1 run scoreboard players get @s rs.knapping.grid.col

scoreboard players operation #knapping.temp rs.knapping.grid.g_id = @s rs.knapping.grid.g_id
scoreboard players operation #knapping.temp rs.knapping.grid.row = @s rs.knapping.grid.row
scoreboard players operation #knapping.temp rs.knapping.grid.col = @s rs.knapping.grid.col

execute as @e[type=minecraft:interaction,tag=grid_storage,sort=nearest] \
    if score @s rs.knapping.grid.g_id = #knapping.temp rs.knapping.grid.g_id \
    run function randomstuff:knapping/grid/grid_cell/flip_bit with storage randomstuff:knapping.grid temp.idx

execute as @e[type=minecraft:block_display,tag=grid_disp] \
    if score @s rs.knapping.grid.g_id = #knapping.temp rs.knapping.grid.g_id \
    if score @s rs.knapping.grid.row = #knapping.temp rs.knapping.grid.row \
    if score @s rs.knapping.grid.col = #knapping.temp rs.knapping.grid.col \
    run kill @s

execute as @s at @s run particle dust{color:[0.4f,0.4f,0.4f],scale:1} ~ ~0.5 ~
execute as @s run kill