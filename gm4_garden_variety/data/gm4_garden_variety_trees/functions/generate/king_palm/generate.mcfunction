# initializes the TREE_TYPE tree's AEC marker
# @s = TREE_TYPE generation AEC marker
# run from gm4_garden_variety_trees:generate/king_palm/generation


# initialize
function gm4_garden_variety:mechanics/tree_generation/pre_clearance_checker

# set tree variables (needed for clearance checker)
function gm4_garden_variety_trees:generate/king_palm/variables/tree_default

# generate if clearance passes check
function gm4_garden_variety:mechanics/clearance_checker/initialize
execute if score $clearance_check gm4_gv_tree_gen matches 1 run function gm4_garden_variety_trees:generate/king_palm/initialize
