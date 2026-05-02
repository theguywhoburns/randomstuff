# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# @s = storage entity
function randomstuff:knapping/grid/storage/extract {target:"randomstuff:knapping.grid state.match",src:"entity @s data.grid"}
data modify storage randomstuff:knapping.grid state.match.input set from entity @s data.resource
function randomstuff:knapping/pattern_matching/match_if with storage randomstuff:knapping.grid state.match

data remove storage randomstuff:knapping.grid state.match