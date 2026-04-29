# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# get stored item
data modify storage randomstuff:temp drop_item set from entity @s data.stored_item
function randomstuff:laying_item/break_summon with storage randomstuff:temp
# kill display then self
execute at @s run kill @e[type=minecraft:item_display, tag=laying_item_display, distance=..0.5]
execute at @s run playsound minecraft:block.stone.break block @a ~ ~ ~ 0.6 1.2
execute at @s run particle minecraft:ash ~ ~ ~
kill @s