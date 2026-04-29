tag @s add randomstuff
tag @s add knapping
tag @s add grid
tag @s add grid_cursor

$data modify entity @s data.resource set value $(id)
$data modify entity @s data.display_resource set value $(disp_id)

scoreboard players operation @s rs.knapping.grid.g_id = #knapping rs.knapping.grid.temp.g_id
scoreboard players set @s rs.knapping.grid.col 0
scoreboard players set @s rs.knapping.grid.row 0