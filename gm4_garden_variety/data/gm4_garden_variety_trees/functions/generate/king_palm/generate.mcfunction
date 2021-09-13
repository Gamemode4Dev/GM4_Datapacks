# generates the tree with the current marker
# @s = @e[type=marker,tag=gm4_gv_sapling,tag=gm4_TREE_TYPE_sapling]
# at @s align xyz
# run from gm4_garden_variety_trees:integration/garden_variety/mechanics/custom_sapling/generate_tree
# run from gm4_garden_variety_trees:generate/king_palm/integration/orbis/generate


# initialize
function gm4_garden_variety:mechanics/tree_generation/pre_clearance_checker

# set tree variables (needed for clearance checker)
function gm4_garden_variety_trees:generate/king_palm/variables/tree_default

# generate if clearance passes check
function gm4_garden_variety:mechanics/clearance_checker/initialize
execute if score $clearance_check gm4_gv_tree_gen matches 1 run function gm4_garden_variety_trees:generate/king_palm/initialize
