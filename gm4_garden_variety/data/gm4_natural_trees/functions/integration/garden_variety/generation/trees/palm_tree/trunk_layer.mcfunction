# generates the tree's trunk layers (calls different function for each tree) 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_garden_variety:generation/trees/palm_tree/trunk

execute if score king_palm gm4_tree_type matches 1 run function gm4_natural_trees:generate/king_palm/trunk_layer
