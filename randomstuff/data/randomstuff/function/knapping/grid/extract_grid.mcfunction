# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# extracts 5x5 grid to storage as v00-v44 keys
# $(target) = base storage path e.g. "randomstuff:knapping.grid state.match"
# $(src) = source: "entity @s" or "storage namespace:path"

$execute store result storage $(target).v00 int 1 run data get $(src)[0][0]
$execute store result storage $(target).v01 int 1 run data get $(src)[0][1]
$execute store result storage $(target).v02 int 1 run data get $(src)[0][2]
$execute store result storage $(target).v03 int 1 run data get $(src)[0][3]
$execute store result storage $(target).v04 int 1 run data get $(src)[0][4]

$execute store result storage $(target).v10 int 1 run data get $(src)[1][0]
$execute store result storage $(target).v11 int 1 run data get $(src)[1][1]
$execute store result storage $(target).v12 int 1 run data get $(src)[1][2]
$execute store result storage $(target).v13 int 1 run data get $(src)[1][3]
$execute store result storage $(target).v14 int 1 run data get $(src)[1][4]

$execute store result storage $(target).v20 int 1 run data get $(src)[2][0]
$execute store result storage $(target).v21 int 1 run data get $(src)[2][1]
$execute store result storage $(target).v22 int 1 run data get $(src)[2][2]
$execute store result storage $(target).v23 int 1 run data get $(src)[2][3]
$execute store result storage $(target).v24 int 1 run data get $(src)[2][4]

$execute store result storage $(target).v30 int 1 run data get $(src)[3][0]
$execute store result storage $(target).v31 int 1 run data get $(src)[3][1]
$execute store result storage $(target).v32 int 1 run data get $(src)[3][2]
$execute store result storage $(target).v33 int 1 run data get $(src)[3][3]
$execute store result storage $(target).v34 int 1 run data get $(src)[3][4]

$execute store result storage $(target).v40 int 1 run data get $(src)[4][0]
$execute store result storage $(target).v41 int 1 run data get $(src)[4][1]
$execute store result storage $(target).v42 int 1 run data get $(src)[4][2]
$execute store result storage $(target).v43 int 1 run data get $(src)[4][3]
$execute store result storage $(target).v44 int 1 run data get $(src)[4][4]