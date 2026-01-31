# build mangrove tree roots
# @s = mangrove tree root marker
# at @s
# run from generate_tree_type/mangrove/roots/schedule

scoreboard players set $max_distance_from_tree gm4_towering_trees_data 7
scoreboard players set $max_length gm4_towering_trees_data 16
function gm4_towering_trees:generate_tree_type/mangrove/roots/loop
kill @s
