# Gets stored_item from data and spawns it, then removes self
data modify storage randomstuff:temp drop_item set from entity @s data.stored_item
function randomstuff:laying_item/break_summon with storage randomstuff:temp
#data remove storage randomstuff:temp drop_item
execute at @s run kill @e[type=minecraft:item_display, tag=laying_item_display, distance=..0.5]
execute at @s run playsound minecraft:block.stone.break block @a ~ ~ ~ 0.6 1.2
execute at @s run particle minecraft:ash ~ ~ ~
kill @s