execute as @e[type=minecraft:interaction, tag=laying_item, nbt={attack:{}}] run function randomstuff:laying_item/break
execute as @e[type=minecraft:interaction, tag=grid_cell, nbt={attack:{}}] run function randomstuff:knapping/grid/grid_cell/on_interact
execute as @e[type=minecraft:interaction, tag=grid_storage, nbt={attack:{}}] run function randomstuff:knapping/grid/grid_storage_on_interact
schedule function randomstuff:tick 1t replace