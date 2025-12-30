
# if block cannot be replaced with root return
execute unless block ~ ~ ~ #gm4_towering_trees:mangrove_root_replaceable run return fail
scoreboard players remove $max_skew_length gm4_towering_trees_data 1
execute unless score $max_skew_length gm4_towering_trees_data matches 1.. run return fail

# fill with (muddy) roots
fill ~ ~ ~ ~ ~ ~ muddy_mangrove_roots replace mud
execute if score $waterlogged gm4_towering_trees_data matches 0 unless block ~ ~ ~ muddy_mangrove_roots run setblock ~ ~ ~ mangrove_roots
execute if score $waterlogged gm4_towering_trees_data matches 1 unless block ~ ~ ~ muddy_mangrove_roots run setblock ~ ~ ~ mangrove_roots[waterlogged=true]

# go down to ground
execute positioned ~ ~-1 ~ run function gm4_towering_trees:generate_tree_type/mangrove/roots/loop_to_ground
