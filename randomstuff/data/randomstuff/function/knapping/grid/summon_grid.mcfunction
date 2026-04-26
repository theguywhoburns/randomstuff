# get snapped player pos via scoreboards
# NOTE: scoreboards are int only, so they round down floating point coords, alowing for easy snapping of said coords
execute store result score @s rs.knapping.grid.base_x run data get entity @s Pos[0] 1
# TODO: player y is rounded down, should be rounded up, can be fixed with a raycast
execute store result score @s rs.knapping.grid.base_y run data get entity @s Pos[1] 1
execute store result score @s rs.knapping.grid.base_z run data get entity @s Pos[2] 1

# set marker pos to snapped player pos
summon minecraft:marker ~ ~ ~ {Tags:["randomstuff","knapping","grid_cursor"]}
execute store result entity @e[type=minecraft:marker,tag=grid_cursor,limit=1] Pos[0] double 1 run scoreboard players get @s rs.knapping.grid.base_x
execute store result entity @e[type=minecraft:marker,tag=grid_cursor,limit=1] Pos[1] double 1 run scoreboard players get @s rs.knapping.grid.base_y
execute store result entity @e[type=minecraft:marker,tag=grid_cursor,limit=1] Pos[2] double 1 run scoreboard players get @s rs.knapping.grid.base_z
# assign a unique id for the marker, then increment the global id
scoreboard players operation @e[type=minecraft:marker,tag=grid_cursor,limit=1] rs.knapping.grid.g_id = #knapping rs.knapping.grid.g_id
scoreboard players add #knapping rs.knapping.grid.g_id 1

# setup loop counter
execute as @e[type=minecraft:marker,tag=grid_cursor,limit=1] run scoreboard players set @s rs.knapping.grid.col 0
execute as @e[type=minecraft:marker,tag=grid_cursor,limit=1] run scoreboard players set @s rs.knapping.grid.row 0

# start/join loop
function randomstuff:knapping/grid/loop_wrapper