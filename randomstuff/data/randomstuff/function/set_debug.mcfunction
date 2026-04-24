scoreboard players operation #temp Debug = $Global Debug
execute if score #temp Debug matches 1 run scoreboard players set $Global Debug 0
execute if score #temp Debug matches 0 run scoreboard players set $Global Debug 1
execute if score $Global Debug matches 1 run tellraw @s {"text": "Debug ON", "color": "green"}
execute if score $Global Debug matches 0 run tellraw @s {"text": "Debug OFF", "color": "red"}
