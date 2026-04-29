# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

execute as @e[type=minecraft:interaction, tag=laying_item] at @s if block ~ ~-0.5 ~ air run function randomstuff:laying_item/break

schedule function randomstuff:tick5 5t replace