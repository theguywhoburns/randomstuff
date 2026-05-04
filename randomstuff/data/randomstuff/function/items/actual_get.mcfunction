# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# gives item from context (id and components available)
$execute at @s run summon minecraft:item ~ ~ ~ {Item:{id:"$(raw)",count:1b, components:$(components)}}
$tellraw @s [\
    {"text":"[", "color": "gray"},\
    {"text":"SUCCESS: ", "color": "green"},\
    {"text":"randomstuff:items/get", "color": "yellow"},\
    {"text":"]: ", "color": "gray"},\
    {"translate": "randomstuff.cmd.give.success",\
        "with": ["$(id)"],"color": "red"\
    }\
]