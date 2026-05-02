# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

execute if score #knapping rs.knapping.item.id matches 1 run \
    function randomstuff:knapping/grid/summon {id:"clay", disp_id:"clay"}
execute if score #knapping rs.knapping.item.id matches 0 run \
    function randomstuff:knapping/grid/summon {id:"rocks", disp_id:"mossy_cobblestone"}

data modify storage randomstuff:knapping.grid state.summon_success set value 1