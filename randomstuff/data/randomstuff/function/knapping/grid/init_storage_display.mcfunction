tag @s add randomstuff
tag @s add knapping
tag @s add grid
tag @s add grid_storage_display

data modify entity @s item set value {id:barrier,components:{item_model:barrier}}
    
scoreboard players operation @s rs.knapping.grid.g_id = \
    #knapping rs.knapping.grid.temp.g_id