# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

execute as @e[type=minecraft:marker,tag=grid_cursor] run function randomstuff:knapping/grid/loop_summon
execute as @e[type=minecraft:marker,tag=grid_cursor,limit=1] run schedule function randomstuff:knapping/grid/loop_wrapper 1t replace