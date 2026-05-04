# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# check if item is in the registry
$execute unless data storage randomstuff:registries items.$(id) run \
    tellraw @s [\
        {"text":"[", "color": "gray"},\
        {"text":"ERROR: ", "color": "red"},\
        {"text":"randomstuff:items/get", "color": "yellow"},\
        {"text":"]: ", "color": "gray"},\
        {"translate": "randomstuff.error.item.not_in_registry",\
            "with": ["$(id)"],"color": "red"\
        }\
    ]
$execute unless data storage randomstuff:registries items.$(id) run return fail

# item is in the registry
# get item components into cache
    
$function randomstuff:items/actual_get with storage randomstuff:registries items.$(id)