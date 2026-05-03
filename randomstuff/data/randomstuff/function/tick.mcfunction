# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

execute as @e[type=minecraft:interaction, tag=randomstuff, nbt={attack:{}}] \
    run function randomstuff:interation_tick

schedule function randomstuff:tick 1t replace