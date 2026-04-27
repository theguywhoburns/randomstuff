scoreboard players operation #knapping rs.knapping.grid.temp.g_id = #knapping rs.knapping.grid.g_id

execute align xz summon minecraft:marker run function randomstuff:knapping/grid/init_marker
execute align xz positioned ~0.5 ~1.5 ~0.5 summon minecraft:bee run function randomstuff:knapping/grid/init_storage
scoreboard players add #knapping rs.knapping.grid.g_id 1

# join loop
schedule function randomstuff:knapping/grid/loop_wrapper 1t replace