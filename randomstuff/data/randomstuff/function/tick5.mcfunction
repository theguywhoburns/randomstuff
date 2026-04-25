execute as @e[type=minecraft:interaction, tag=laying_item] at @s if block ~ ~-0.5 ~ air run function randomstuff:laying_item/break

schedule function randomstuff:tick5 5t replace