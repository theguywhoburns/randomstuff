scoreboard players operation #knapping rs.knapping.grid.temp.g_id = @s rs.knapping.grid.g_id
data modify storage randomstuff:knapping.grid state.resource set from entity @s data
execute as @s run function randomstuff:knapping/pattern_matching/match
# state is referenced from on_match in the pattern_matching
data modify storage randomstuff:knapping.grid state.resource set from entity @s data
execute \
    if data storage randomstuff:knapping.grid state.resource.result \
    at @s as @e[type=minecraft:item_display,tag=grid_storage_display,sort=nearest] \
    if score @s rs.knapping.grid.g_id = #knapping rs.knapping.grid.temp.g_id run \
    data modify entity @s item set from storage randomstuff:knapping.grid state.resource.result

execute \
    unless data storage randomstuff:knapping.grid state.resource.result \
    at @s as @e[type=minecraft:item_display,tag=grid_storage_display,sort=nearest] \
    if score @s rs.knapping.grid.g_id = #knapping rs.knapping.grid.temp.g_id run \
    data modify entity @s item set value {id:"minecraft:barrier"}

data remove storage randomstuff:knapping.grid state.resource