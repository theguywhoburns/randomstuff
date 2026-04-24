function randomstuff:pebbles/break_map
kill @s
execute at @s run kill @e[type=minecraft:item_display, tag=pebble_display, distance=..0.5]
execute at @s run playsound minecraft:block.stone.break block @a ~ ~ ~ 0.6 1.2
execute at @s run particle minecraft:ash ~ ~ ~