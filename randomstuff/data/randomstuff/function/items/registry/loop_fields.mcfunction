# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

$data modify storage randomstuff:registries items.$(id).components merge from storage \
    randomstuff:registries temp.item_fields[-1].field
data remove storage randomstuff:registries temp.item_fields[-1]
execute if data storage randomstuff:registries temp.item_fields[-1] run \
    function randomstuff:items/registry/loop_fields {id: "$(id)"}