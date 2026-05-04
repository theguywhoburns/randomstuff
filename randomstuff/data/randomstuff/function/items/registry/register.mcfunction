# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# Old one for comparison
# function randomstuff:items/register_item {\
#     "id":"minecraft:flint_and_steel",\
#     "custom_id":"flint_and_flint",\
#     "components":{\
#         "custom_data":{\
#             "randomstuff":1,\
#             "id":"flint_and_flint"\
#         },\
#         "item_name":{\
#             "translate":"randomstuff.item.flint_and_flint"\
#         },\
#         "max_damage":12,\
#         "item_model":"randomstuff:flint_and_flint"\
#     },\
#     "fields": [{"field":"custom_data"},{"field":"item_name"},{"field":"max_damage"},{"field":"item_model"}]\
# }

# New one
# function randomstuff:items/registry/register {\
#     id:"flint_and_flint",\
#     raw:"flint_and_steel",\
#     fields:[\
#         {field:{max_damage:12}},\
#     ]\
# }

$execute if data storage randomstuff:registries items.$(id) run return fail

$data modify storage randomstuff:registries items.$(id) set value {\
    id:"$(raw)",\
    components: {\
        custom_data: {\
            id:$(id),\
        },\
        item_name: {\
            translate: "randomstuff.items.$(id)"\
        },\
        item_model: "randomstuff:$(id)"\
    },\
    fields:$(fields),\
}

# fields loop
# future proofing by fetching said fields from storage and not directly with $(fields)
# yes i did that on purpose, cus i find it more cool
$data modify storage randomstuff:registries temp.item_fields set \
    from storage randomstuff:registries items.$(id).fields
$execute if data storage randomstuff:registries temp.item_fields[-1] run \
 function randomstuff:items/registry/loop_fields {id:"$(id)"}
data remove storage randomstuff:registries temp.item_fields
