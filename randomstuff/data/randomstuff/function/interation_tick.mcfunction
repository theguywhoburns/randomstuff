# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

execute as @s[type=minecraft:interaction, tag=laying_item, nbt={attack:{}}] run function randomstuff:laying_item/break
execute as @s[type=minecraft:interaction, tag=grid_cell, nbt={attack:{}}] run function randomstuff:knapping/grid/grid_cell/on_interact
execute as @s[type=minecraft:interaction, tag=grid_storage, nbt={attack:{}}] run function randomstuff:knapping/grid/storage/on_interact
