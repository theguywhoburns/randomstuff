# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

tag @s add randomstuff
tag @s add knapping
tag @s add grid
tag @s add grid_storage_display

data modify entity @s item set value {id:barrier,components:{item_model:barrier}}
    
scoreboard players operation @s rs.knapping.grid.g_id = \
    #knapping.temp rs.knapping.grid.g_id