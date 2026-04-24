execute if score $Global Debug matches 1 as @s run tellraw @a {"nbt":"Tags", "entity":"@s"}

execute if entity @s[tag=copper] run function randomstuff:item/copper/summon_raw
execute if entity @s[tag=zinc] run function randomstuff:item/zinc/summon_raw