scoreboard players operation #knapping rs.knapping.grid.temp.g_id = #knapping rs.knapping.grid.g_id

# summon marker with it's pos aligned relative to the player
execute align xz run summon minecraft:marker ~ ~ ~ {\
    Tags:[\
        "randomstuff",\
        "knapping",\
        "grid_cursor"\
    ],\
}
# copy tmp to the marker
scoreboard players operation @e[type=minecraft:marker,tag=grid_cursor,limit=1] rs.knapping.grid.g_id = #knapping rs.knapping.grid.temp.g_id

execute align xz positioned ~0.5 ~1.5 ~0.5 summon minecraft:bee run function randomstuff:knapping/grid/init_storage
scoreboard players add #knapping rs.knapping.grid.g_id 1

# setup loop counter
execute as @e[type=minecraft:marker,tag=grid_cursor,limit=1] run scoreboard players set @s rs.knapping.grid.col 0
execute as @e[type=minecraft:marker,tag=grid_cursor,limit=1] run scoreboard players set @s rs.knapping.grid.row 0

# join loop
schedule function randomstuff:knapping/grid/loop_wrapper 1t replace