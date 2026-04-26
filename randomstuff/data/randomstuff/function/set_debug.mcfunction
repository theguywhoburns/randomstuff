scoreboard players operation #temp rs.util.debug = $Global rs.util.debug
execute if score #temp rs.util.debug matches 1 run scoreboard players set $Global rs.util.debug 0
execute if score #temp rs.util.debug matches 0 run scoreboard players set $Global rs.util.debug 1
execute if score $Global rs.util.debug matches 1 run tellraw @s {"text": "rs.util.debug ON", "color": "green"}
execute if score $Global rs.util.debug matches 0 run tellraw @s {"text": "rs.util.debug OFF", "color": "red"}
