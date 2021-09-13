# generates the palm layer
# @s = @e[type=marker,tag=gm4_tree_palm_marker]
# at @s
# run from gm4_garden_variety_trees:integration/garden_variety/mechanics/tree_generation/palm_layer

# generate sapling leaves
execute if score $sapling_leaves gm4_gv_tree_gen matches 1.. if score $current_leaf_layer gm4_gv_tree_gen >= $sapling_leaves_start_layer gm4_gv_tree_gen run function gm4_garden_variety_trees:generate/king_palm/sapling_leaf/attempt
