# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

#rs = randomstuff
scoreboard objectives add rs.knapping.grid.g_id dummy
scoreboard objectives add rs.knapping.grid.row dummy
scoreboard objectives add rs.knapping.grid.col dummy
scoreboard objectives add rs.knapping.grid.flips dummy

# TODO: This is a temorary solution for carrying hardcoded item id's for the raycast
scoreboard objectives add rs.knapping.item.id dummy
scoreboard players set #knapping rs.knapping.grid.g_id 1

function randomstuff:items/load_items

schedule function randomstuff:tick 1t replace
schedule function randomstuff:tick5 5t replace