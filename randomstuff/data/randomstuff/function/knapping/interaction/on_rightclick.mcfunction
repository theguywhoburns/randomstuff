# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

advancement revoke @s only randomstuff:knapping_rightclick

execute as @s[nbt=!{SelectedItem:{count:1}}] if items entity @s weapon.mainhand minecraft:clay_ball run \
    data modify storage randomstuff:knapping.grid state.has_items set value 1

execute if data storage randomstuff:knapping.grid state.has_items \
    anchored eyes positioned ^ ^ ^ \
    store result score #hit bs.raycast.id \
    run function #bs.raycast:run {with:{max_distance:10,on_targeted_block:\
        "execute positioned ~ ~1 ~ unless entity @e[dy=1] run function randomstuff:knapping/interaction/on_rightclick_success"\
    }}

execute if score #hit bs.raycast.id matches 1 if data storage randomstuff:knapping.grid state.summon_success run item modify entity @s weapon.mainhand {function:"minecraft:set_count", count:-1, add:true}

data remove storage randomstuff:knapping.grid state.has_items
data remove storage randomstuff:knapping.grid state.summon_success
