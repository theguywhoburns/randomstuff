advancement revoke @s only randomstuff:knapping_rightclick

execute as @s[nbt=!{SelectedItem:{count:1}}] if items entity @s weapon.mainhand minecraft:clay_ball run \
    data modify storage randomstuff:knapping.grid state.has_items set value 1

execute if data storage randomstuff:knapping.grid state.has_items run item modify entity @s weapon.mainhand {function:"minecraft:set_count", count:-1, add:true}
execute if data storage randomstuff:knapping.grid state.has_items run function randomstuff:knapping/grid/summon_grid {id:"clay", disp_id:"clay"}

data remove storage randomstuff:knapping.grid has_items
