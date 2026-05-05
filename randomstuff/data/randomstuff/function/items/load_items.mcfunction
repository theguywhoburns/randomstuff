# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

function randomstuff:items/registry/register {\
    id:"flint_and_flint",\
    raw:"minecraft:flint_and_steel",\
    fields:[\
        {field:{max_damage:12}},\
    ]\
}
function randomstuff:items/registry/register {\
    id:"tool_stick",\
    raw:"minecraft:stick",\
    fields:[\
        {field:{consumable:{consume_seconds:1000000000}}},\
    ]\
}
function randomstuff:items/registry/register {\
    id:"stone_knife_head",\
    raw:"minecraft:prismarine_shard",\
    fields:[]\
}
function randomstuff:items/registry/register {\
    id:"stone_axe_head",\
    raw:"minecraft:prismarine_shard",\
    fields:[]\
}
function randomstuff:items/registry/register {\
    id:"stone_shovel_head",\
    raw:"minecraft:prismarine_shard",\
    fields:[]\
}
function randomstuff:items/registry/register {\
    id:"knappable_clay",\
    raw:"minecraft:clay_ball",\
    fields:[\
        {field:{consumable:{consume_seconds:1000000000}}},\
        {field:{item_model:"minecraft:clay_ball"}},\
        {field:{custom_data:{knappable:true}}},\
    ]\
}
function randomstuff:items/registry/register {\
    id:"knappable_rock",\
    raw:"minecraft:iron_nugget",\
    fields:[\
        {field:{consumable:{consume_seconds:1000000000}}},\
        {field:{item_model:"minecraft:iron_nugget"}},\
        {field:{custom_data:{knappable:true}}},\
    ]\
}