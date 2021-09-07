# initializes the TREE_TYPE tree's AEC marker
# @s = TREE_TYPE generation AEC marker
# run from gm4_garden_variety_trees:generate/king_palm/generation


# place fruit
setblock ~ ~ ~ birch_leaves[persistent=true] keep
execute positioned ~ ~-1 ~ run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/generate
