# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

scoreboard players operation #knapping rs.knapping.grid.temp.g_id = @s rs.knapping.grid.g_id
data modify storage randomstuff:knapping.grid state.resource set from entity @s data
# ran once on finished init
execute as @e[type=minecraft:interaction,tag=grid_storage,sort=nearest] \
    if score @s rs.knapping.grid.g_id = #knapping rs.knapping.grid.temp.g_id run \
    function randomstuff:knapping/grid/update_storage

data remove storage randomstuff:knapping.grid state.resource
return run kill @s