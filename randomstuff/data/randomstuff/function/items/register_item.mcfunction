# $id = item id
# $components = item components json
# Stores item data and adds id to registry

$data modify storage randomstuff:items $(custom_id) set value {id:"$(id)",components:$(components),fields:$(fields),custom_id:$(custom_id)}
$data modify storage randomstuff:registries.items array append value {entry:"$(custom_id)"}