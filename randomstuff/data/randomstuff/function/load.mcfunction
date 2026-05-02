# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

#rs = randomstuff
scoreboard objectives add rs.util.debug dummy

scoreboard objectives add rs.knapping.grid.g_id dummy
scoreboard objectives add rs.knapping.grid.row dummy
scoreboard objectives add rs.knapping.grid.col dummy
scoreboard objectives add rs.knapping.grid.flips dummy

scoreboard objectives add rs.knapping.grid.temp.g_id dummy
scoreboard objectives add rs.knapping.grid.temp.row dummy
scoreboard objectives add rs.knapping.grid.temp.col dummy

# TODO: This is a temorary solution for carrying hardcoded item id's for the raycast
scoreboard objectives add rs.knapping.item.id dummy

# TODO: remove this shit and find a proper alternative
scoreboard objectives add holding_clay dummy

# TODO: add a check for that
scoreboard players set #knapping rs.knapping.grid.g_id 1

function randomstuff:items/register_test

schedule function randomstuff:tick 1t replace
schedule function randomstuff:tick5 5t replace