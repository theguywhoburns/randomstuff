# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# NOTE: assumes the execution is done as the display entity

# safety display set in case the macro one fails
data modify entity @s block_state set value {Name:"minecraft:barrier"}

data modify entity @s transformation set value {\
    translation:[0.0f,0.0f,0.0f],\
    scale:[0.175f,0.175f,0.175f],\
    left_rotation:[0.0f,0.0f,0.0f,1.0f],\
    right_rotation:[0.0f,0.0f,0.0f,1.0f]\
}

tag @s add randomstuff
tag @s add knapping
tag @s add grid
tag @s add grid_disp

scoreboard players operation @s rs.knapping.grid.g_id = \
    #knapping rs.knapping.grid.temp.g_id
scoreboard players operation @s rs.knapping.grid.row = \
    #knapping rs.knapping.grid.temp.row
scoreboard players operation @s rs.knapping.grid.col = \
    #knapping rs.knapping.grid.temp.col

$data modify entity @s block_state set value {Name:$(display_resource)}
