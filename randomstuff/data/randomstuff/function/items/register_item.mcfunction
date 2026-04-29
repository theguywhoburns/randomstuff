# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# $id = item id
# $components = item components json
# stores item data and adds id to registry

$execute if data storage randomstuff:items $(id) run tellraw @a [\
  {"text":"[", "color": "gray"},\
  {"text":"ERROR: ", "color": "red"},\
  {"text":"randomstuff:items/register_item", "color": "yellow"},\
  {"text":"]:", "color": "gray"},\
  {"text":"] Item already in registry: ", "color": "red"},\
  {"text":"$(id)", "color": "white"}\
]
$execute if data storage randomstuff:items $(id) run return fail

$data modify storage randomstuff:items $(custom_id) set value {id:"$(id)",components:$(components),fields:$(fields),custom_id:$(custom_id)}
$data modify storage randomstuff:registries.items array append value {entry:"$(custom_id)"}