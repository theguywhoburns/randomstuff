# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
scoreboard players operation #knapping.temp rs.knapping.grid.g_id = #knapping rs.knapping.grid.g_id


$execute align xz summon minecraft:marker run function randomstuff:knapping/grid/init_marker {"id":$(id),"disp_id": $(disp_id)}
$execute align xz positioned ~0.5 ~1.5 ~0.5 summon minecraft:interaction run function randomstuff:knapping/grid/storage/init {"id":$(id),"disp_id": $(disp_id)}
$execute align xz positioned ~0.5 ~2 ~0.5 summon minecraft:item_display run function randomstuff:knapping/grid/storage/init_display {"id":$(id),"disp_id": $(disp_id)}

scoreboard players add #knapping rs.knapping.grid.g_id 1

# join loop
schedule function randomstuff:knapping/grid/loop_wrapper 1t replace