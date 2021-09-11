# generate the tree's palm layers (about 1 block)
# @s = TREE_TYPE palm AEC marker
# run from gm4_garden_variety:mechanics/tree_generation/palm_tree/palm_layer

# generate sapling leaves
execute if score $sapling_leaves gm4_gv_tree_gen matches 1.. if score $current_leaf_layer gm4_gv_tree_gen >= $sapling_leaves_start_layer gm4_gv_tree_gen run function gm4_garden_variety_trees:generate/king_palm/sapling_leaf/attempt
