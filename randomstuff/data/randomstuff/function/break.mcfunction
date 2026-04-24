# 1. Kill the interaction entity itself
kill @s

# 2. Kill the paired display entity (nearest within 0.5 blocks)
execute at @s run kill @e[type=minecraft:item_display, tag=pebble_display, distance=..0.5]

# 3. Drop the actual pebble item
execute at @s run summon item ~ ~ ~ {Item:{id:"acacia_boat", count:1b}, Age:0s, PickupDelay:0s}

# 4. Feedback (sound + particles)
execute at @s run playsound minecraft:block.stone.break block @a ~ ~ ~ 0.6 1.2
execute at @s run particle minecraft:ash ~ ~ ~