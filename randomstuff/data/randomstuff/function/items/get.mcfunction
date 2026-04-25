# check if item is in the registry
$execute unless data storage randomstuff:items $(id) run \
    tellraw @s [\
        {"text":"[", "color": "gray"},\
        {"text":"ERROR: ", "color": "red"},\
        {"text":"randomstuff:items/get", "color": "yellow"},\
        {"text":"]: ", "color": "gray"},\
        {"translate": "randomstuff.error.item.not_in_registry",\
            "with": ["$(id)"],"color": "red"\
        }\
    ]
$execute unless data storage randomstuff:items $(id) run return fail

# item is in the registry
# get item components into cache

$function randomstuff:items/actual_get with storage randomstuff:items $(id)