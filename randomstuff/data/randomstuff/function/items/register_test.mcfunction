# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

function randomstuff:items/register_item {\
    "id":"minecraft:flint_and_steel",\
    "custom_id":"flint_and_flint",\
    "components":{\
        "custom_data":{\
            "randomstuff":1,\
            "id":"flint_and_flint"\
        },\
        "item_name":{\
            "translate":"randomstuff.item.flint_and_flint"\
        },\
        "max_damage":12,\
        "item_model":"randomstuff:flint_and_flint"\
    },\
    "fields": [{"field":"custom_data"},{"field":"item_name"},{"field":"max_damage"},{"field":"item_model"}]\
}
