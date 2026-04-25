# Gives item from context (id and components available)
$execute at @s run summon minecraft:item ~ ~ ~ {Item:{id:"$(id)",count:1b, components:$(components)}}
$tellraw @s [\
    {"text":"[", "color": "gray"},\
    {"text":"SUCCESS: ", "color": "green"},\
    {"text":"randomstuff:items/get", "color": "yellow"},\
    {"text":"]: ", "color": "gray"},\
    {"translate": "randomstuff.cmd.give.success",\
        "with": ["$(custom_id)"],"color": "red"\
    }\
]