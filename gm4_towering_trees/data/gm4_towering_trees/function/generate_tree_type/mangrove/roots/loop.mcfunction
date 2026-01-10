# build mangrove tree roots
# @s = mangrove tree root marker
# at @s positioned ^ ^-y ^z, randomly offset
# run from generate_tree_type/mangrove/roots/start
# run from here

# if block cannot be replaced with root or max length was reached return
execute unless block ~ ~ ~ #gm4_towering_trees:mangrove_root_replaceable run return fail
scoreboard players remove $max_length gm4_towering_trees_data 1
execute unless score $max_length gm4_towering_trees_data matches 1.. run return fail

# fill with muddy / waterlogged / normal roots
fill ~ ~ ~ ~ ~ ~ muddy_mangrove_roots replace mud
fill ~ ~ ~ ~ ~ ~ mangrove_roots[waterlogged=true] replace #gm4:water
execute unless block ~ ~ ~ mangrove_roots unless block ~ ~ ~ muddy_mangrove_roots run setblock ~ ~ ~ mangrove_roots

# random carpets
execute if predicate {condition:"random_chance",chance:0.5} run fill ~ ~1 ~ ~ ~1 ~ moss_carpet replace #air

# small chance to skew to ground from now on
execute if predicate {condition:"random_chance",chance:0.02} run tag @s add gm4_towering_trees.mangrove_root_skewed

# pick direction
execute if predicate {condition:"random_chance",chance:0.8} positioned ~ ~-1 ~ run return run function gm4_towering_trees:generate_tree_type/mangrove/roots/loop
execute if score $max_distance_from_tree gm4_towering_trees_data matches 0 positioned ~ ~-1 ~ run return run function gm4_towering_trees:generate_tree_type/mangrove/roots/loop

# if skewed to ground start a loop down if the root is going forward
scoreboard players set $max_skew_length gm4_towering_trees_data 5
execute if entity @s[tag=gm4_towering_trees.mangrove_root_skewed] positioned ~ ~-1 ~ run function gm4_towering_trees:generate_tree_type/mangrove/roots/loop_to_ground

scoreboard players remove $max_distance_from_tree gm4_towering_trees_data 1
execute positioned ^ ^ ^1 run function gm4_towering_trees:generate_tree_type/mangrove/roots/loop
