# NOTE: assumes the execution is done as the display entity
data modify entity @s block_state set value {Name:"minecraft:mossy_stone_bricks"}
data modify entity @s transformation set value {\
    translation:[0.0f,0.0f,0.0f],\
    scale:[0.175f,0.175f,0.175f],\
    left_rotation:[0.0f,0.0f,0.0f,1.0f],\
    right_rotation:[0.0f,0.0f,0.0f,1.0f]\
}

tag @s add randomstuff
tag @s add knapping
tag @s add grid_disp

scoreboard players operation @s rs.knapping.grid.g_id = \
    #knapping rs.knapping.grid.temp.g_id
scoreboard players operation @s rs.knapping.grid.row = \
    #knapping rs.knapping.grid.temp.row
scoreboard players operation @s rs.knapping.grid.col = \
    #knapping rs.knapping.grid.temp.col