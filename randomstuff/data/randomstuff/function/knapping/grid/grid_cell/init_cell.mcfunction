# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# NOTE: assumes the execution is done as the interaction entity
data modify entity @s width set value 0.175f
data modify entity @s height set value 0.175f

tag @s add randomstuff
tag @s add knapping
tag @s add grid
tag @s add grid_cell

scoreboard players operation @s rs.knapping.grid.g_id = \
    #knapping.temp rs.knapping.grid.g_id
scoreboard players operation @s rs.knapping.grid.row = \
    #knapping.temp rs.knapping.grid.row
scoreboard players operation @s rs.knapping.grid.col = \
    #knapping.temp rs.knapping.grid.col