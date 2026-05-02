# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# recipes defined as 2D grids, extracted to flat keys at load time
# match_if.mcfunction looks up flat keys (v00.v01.v02...) in patterns.tree

# flint - full 5x5
data modify storage randomstuff:knapping.patterns raw.flint set value {\
    grid: [\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b],\
        [1b,1b,1b,1b,1b]\
    ],\
    result: {\
        input: "clay", \
        item: {\
            id:"minecraft:flint",count:1b\
        }\  
    }\
}
function randomstuff:knapping/grid/storage/extract {target:"randomstuff:knapping.patterns raw.flint.result",src:"storage randomstuff:knapping.patterns raw.flint.grid"}
function randomstuff:knapping/pattern_matching/register_recipe with storage randomstuff:knapping.patterns raw.flint.result

# iron_ingot - single corner
data modify storage randomstuff:knapping.patterns raw.iron_ingot set value {\
    grid: [\
        [1b,0b,0b,0b,0b],\
        [0b,0b,0b,0b,0b],\
        [0b,0b,0b,0b,0b],\
        [0b,0b,0b,0b,0b],\
        [0b,0b,0b,0b,0b]\
    ],\
    result: {\
        input: "rocks", \
        item: {\
            id:"minecraft:iron_ingot",count:1b\
        }\
    }\
}
function randomstuff:knapping/grid/storage/extract {target:"randomstuff:knapping.patterns raw.iron_ingot.result",src:"storage randomstuff:knapping.patterns raw.iron_ingot.grid"}
function randomstuff:knapping/pattern_matching/register_recipe with storage randomstuff:knapping.patterns raw.iron_ingot.result