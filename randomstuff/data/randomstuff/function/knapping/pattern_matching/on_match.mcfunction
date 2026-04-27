# NOTE: Assumes execution from the knapping storage entity(for now)
# TODO: Reference the storage based on g_id and modify the display item and item to drop on click
$execute at @s run summon minecraft:item ~ ~1 ~ {Item:$(result)}