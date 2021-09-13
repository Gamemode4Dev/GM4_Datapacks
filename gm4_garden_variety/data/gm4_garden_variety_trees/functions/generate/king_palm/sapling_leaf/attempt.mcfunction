# attempts to generate the sapling leaf
# @s = @e[type=marker,tag=gm4_tree_palm_marker]
# at @s
# run from gm4_garden_variety_trees:generate/TREE_TYPE/integration/garden_variety/mechanics/tree_generation/palm_layer


function gm4_garden_variety:utility/get/seed/next_value
scoreboard players operation $sapling_leaf_success gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $sapling_leaf_success gm4_gv_tree_gen %= $sapling_leaves_layer_chance gm4_gv_tree_gen

execute if score $sapling_leaf_success gm4_gv_tree_gen matches 0 at @s if block ~ ~ ~ #minecraft:leaves run function gm4_garden_variety_trees:generate/king_palm/sapling_leaf/generate
