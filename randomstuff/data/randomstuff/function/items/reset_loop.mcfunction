data remove storage randomstuff:registries.items array[-1]
execute if data storage randomstuff:registries.items array[-1] run function randomstuff:items/reset_loop with storage randomstuff:registries.items array[-1]

$tellraw @s [\
    {"text":"[", "color": "gray"},\
    {"text":"randomstuff:items/reset_loop", "color": "yellow"},\
    {"text":"]: ", "color": "gray"},\
    {"translate": "randomstuff.item.removed",\
        "with": ["$(entry)"], "color": "red"\
    }\
]