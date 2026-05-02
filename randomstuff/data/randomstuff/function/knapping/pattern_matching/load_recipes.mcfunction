# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# recipes defined as 2D grids, extracted to flat keys at load time
# match_if.mcfunction looks up flat keys (v00.v01.v02...) in patterns.tree

function randomstuff:knapping/pattern_matching/register_simple_recipe {\
    grid: [\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b]\
    ],\
    id: "flint",\
    input: "clay", \
    result: {\
        item: {\
            id:"minecraft:flint",count:1b\
        }\  
    }\
}

# iron_ingot - single corner
function randomstuff:knapping/pattern_matching/register_simple_recipe {\
    grid: [\
        [1b,0b,0b,0b,0b],\
        [0b,0b,0b,0b,0b],\
        [0b,0b,0b,0b,0b],\
        [0b,0b,0b,0b,0b],\
        [0b,0b,0b,0b,0b]\
    ],\
    id: "iron_ingot",\
    input: "rocks", \
    result: {\
        item: {\
            id:"minecraft:iron_ingot",count:1b\
        }\
    }\
}
