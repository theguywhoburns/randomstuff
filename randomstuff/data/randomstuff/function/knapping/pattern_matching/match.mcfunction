# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# @s = storage entity
execute store result storage randomstuff:knapping.grid state.match.v00 int 1 run data get entity @s data.grid[0][0]
execute store result storage randomstuff:knapping.grid state.match.v01 int 1 run data get entity @s data.grid[0][1]
execute store result storage randomstuff:knapping.grid state.match.v02 int 1 run data get entity @s data.grid[0][2]
execute store result storage randomstuff:knapping.grid state.match.v03 int 1 run data get entity @s data.grid[0][3]
execute store result storage randomstuff:knapping.grid state.match.v04 int 1 run data get entity @s data.grid[0][4]

execute store result storage randomstuff:knapping.grid state.match.v10 int 1 run data get entity @s data.grid[1][0]
execute store result storage randomstuff:knapping.grid state.match.v11 int 1 run data get entity @s data.grid[1][1]
execute store result storage randomstuff:knapping.grid state.match.v12 int 1 run data get entity @s data.grid[1][2]
execute store result storage randomstuff:knapping.grid state.match.v13 int 1 run data get entity @s data.grid[1][3]
execute store result storage randomstuff:knapping.grid state.match.v14 int 1 run data get entity @s data.grid[1][4]

execute store result storage randomstuff:knapping.grid state.match.v20 int 1 run data get entity @s data.grid[2][0]
execute store result storage randomstuff:knapping.grid state.match.v21 int 1 run data get entity @s data.grid[2][1]
execute store result storage randomstuff:knapping.grid state.match.v22 int 1 run data get entity @s data.grid[2][2]
execute store result storage randomstuff:knapping.grid state.match.v23 int 1 run data get entity @s data.grid[2][3]
execute store result storage randomstuff:knapping.grid state.match.v24 int 1 run data get entity @s data.grid[2][4]

execute store result storage randomstuff:knapping.grid state.match.v30 int 1 run data get entity @s data.grid[3][0]
execute store result storage randomstuff:knapping.grid state.match.v31 int 1 run data get entity @s data.grid[3][1]
execute store result storage randomstuff:knapping.grid state.match.v32 int 1 run data get entity @s data.grid[3][2]
execute store result storage randomstuff:knapping.grid state.match.v33 int 1 run data get entity @s data.grid[3][3]
execute store result storage randomstuff:knapping.grid state.match.v34 int 1 run data get entity @s data.grid[3][4]

execute store result storage randomstuff:knapping.grid state.match.v40 int 1 run data get entity @s data.grid[4][0]
execute store result storage randomstuff:knapping.grid state.match.v41 int 1 run data get entity @s data.grid[4][1]
execute store result storage randomstuff:knapping.grid state.match.v42 int 1 run data get entity @s data.grid[4][2]
execute store result storage randomstuff:knapping.grid state.match.v43 int 1 run data get entity @s data.grid[4][3]
execute store result storage randomstuff:knapping.grid state.match.v44 int 1 run data get entity @s data.grid[4][4]

function randomstuff:knapping/pattern_matching/match_if with storage randomstuff:knapping.grid state.match

data remove storage randomstuff:knapping.grid state.match