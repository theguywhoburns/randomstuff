# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

$data modify entity @s data.grid[$(row)][$(col)] set value 0b
scoreboard players add @s rs.knapping.grid.flips 1
execute if score @s rs.knapping.grid.flips matches 25.. run \
    function randomstuff:knapping/grid/cleanup with storage randomstuff:knapping.grid.temp.idx
execute unless score @s rs.knapping.grid.flips matches 25.. run \
    function randomstuff:knapping/grid/storage/update