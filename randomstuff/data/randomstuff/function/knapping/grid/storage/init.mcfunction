# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# NOTE: tmp nbt values for bee to not move
data modify entity @s NoAI set value 1b
data modify entity @s NoGravity set value 1b
data modify entity @s Invulnerable set value 1b

# storage to check if we destroyed all the grid cells
# if reached 25, we destroy the storage
$data modify entity @s data.resource set value $(id)
$data modify entity @s data.display_resource set value $(disp_id)
# there's also data.matched_recipe but such is updated with on_interact
data modify entity @s data.flips set value 0

tag @s add randomstuff
tag @s add knapping
tag @s add grid
tag @s add grid_storage

data modify entity @s data.grid set value [\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
    ]
scoreboard players operation @s rs.knapping.grid.g_id = \
    #knapping.temp rs.knapping.grid.g_id
scoreboard players set @s rs.knapping.grid.flips 0