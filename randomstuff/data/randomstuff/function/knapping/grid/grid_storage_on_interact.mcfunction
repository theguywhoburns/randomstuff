# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

scoreboard players operation #knapping rs.knapping.grid.temp.g_id = @s rs.knapping.grid.g_id

execute as @s at @s if data entity @s data.result run \
    function randomstuff:knapping/grid/grid_storage_fini with entity @s data
# TODO: Horrendous selector, fix with a ranged one later
execute as @e[tag=grid] \
    if score @s rs.knapping.grid.g_id = #knapping rs.knapping.grid.temp.g_id \
    run kill