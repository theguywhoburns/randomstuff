# Store player position to scoreboard
execute store result score @s rs.knapping.grid.base_x run data get entity @s Pos[0] 1
execute store result score @s rs.knapping.grid.base_y run data get entity @s Pos[1] 1
execute store result score @s rs.knapping.grid.base_z run data get entity @s Pos[2] 1

# Summon marker at player then move to stored position
summon minecraft:marker ~ ~ ~ {Tags:["randomstuff","grid_cursor"]}
execute store result entity @e[type=minecraft:marker,tag=grid_cursor,limit=1] Pos[0] double 1 run scoreboard players get @s rs.knapping.grid.base_x
execute store result entity @e[type=minecraft:marker,tag=grid_cursor,limit=1] Pos[1] double 1 run scoreboard players get @s rs.knapping.grid.base_y
execute store result entity @e[type=minecraft:marker,tag=grid_cursor,limit=1] Pos[2] double 1 run scoreboard players get @s rs.knapping.grid.base_z

# Set loop counters on marker
execute as @e[type=minecraft:marker,tag=grid_cursor,limit=1] run scoreboard players set @s rs.knapping.grid.col 0
execute as @e[type=minecraft:marker,tag=grid_cursor,limit=1] run scoreboard players set @s rs.knapping.grid.row 0

# Start the loop or join it
function randomstuff:knapping/grid/loop_wrapper