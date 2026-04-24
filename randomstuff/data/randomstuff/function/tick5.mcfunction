execute as @e[type=minecraft:interaction, tag=pebble] at @s if block ~ ~-0.5 ~ air run function randomstuff:pebbles/break

schedule function randomstuff:tick5 5t replace