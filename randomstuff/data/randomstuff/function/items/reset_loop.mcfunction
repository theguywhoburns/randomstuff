# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

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