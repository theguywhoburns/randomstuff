#rs = randomstuff
scoreboard objectives add rs.util.debug dummy

scoreboard objectives add rs.knapping.grid.base_x dummy
scoreboard objectives add rs.knapping.grid.base_y dummy
scoreboard objectives add rs.knapping.grid.base_z dummy
scoreboard objectives add rs.knapping.grid.col dummy
scoreboard objectives add rs.knapping.grid.row dummy

scoreboard objectives add rs.knapping.grid.g_id dummy
scoreboard objectives add rs.knapping.grid.temp.g_id dummy
scoreboard objectives add rs.knapping.grid.temp.row dummy
scoreboard objectives add rs.knapping.grid.temp.col dummy
# todo, add a check for that
scoreboard players set #knapping rs.knapping.grid.g_id 1

function randomstuff:tick5
function randomstuff:items/register_test.mcfunction
