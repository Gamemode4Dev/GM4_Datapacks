# generates the tree's trunk segments (calls different function for each tree) 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_garden_variety:mechanics/tree_generation/palm_tree/trunk

execute if score king_palm gm4_tree_type matches 1 run function gm4_garden_variety_trees:generate/king_palm/integration/garden_variety/generation/tree_generation/trunk_segment
