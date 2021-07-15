# generates the tree's palm layers (calls different function for each tree) 
# @s = TREE_TYPE palm AEC marker
# run from gm4_garden_variety:generation/trees/palm_tree/palm

execute if score king_palm gm4_tree_type matches 1 run function gm4_natural_trees:generate/king_palm/palm_layer


