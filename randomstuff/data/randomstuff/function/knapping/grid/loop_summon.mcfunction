# NOTE: the function assumes execution from the entity side for selector perfomance

# col >= 5? row++
execute if score @s rs.knapping.grid.col matches 5.. run scoreboard players add @s rs.knapping.grid.row 1
execute if score @s rs.knapping.grid.col matches 5.. run execute as @s at @s run tp @s ~-0.875 ~ ~0.175
execute if score @s rs.knapping.grid.col matches 5.. run scoreboard players set @s rs.knapping.grid.col 0

# row >= 5? exit
execute if score @s rs.knapping.grid.row matches 5.. run return run kill

# prepare temp values
scoreboard players operation #knapping rs.knapping.grid.temp.g_id = @s rs.knapping.grid.g_id
scoreboard players operation #knapping rs.knapping.grid.temp.row = @s rs.knapping.grid.row
scoreboard players operation #knapping rs.knapping.grid.temp.col = @s rs.knapping.grid.col

# spawn display and interaction of said display
execute at @s run summon minecraft:block_display ~0.0625 ~ ~0.0625 {Tags:["randomstuff","knapping","grid_disp"],block_state:{Name:"minecraft:mossy_stone_bricks"},transformation:{translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.175f,0.175f,0.175f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute at @s positioned ~0.15 ~ ~0.15 summon minecraft:interaction run function randomstuff:knapping/grid/init_interaction



# move to the next cell
execute at @s run tp @s ~0.175 ~ ~

scoreboard players add @s rs.knapping.grid.col 1