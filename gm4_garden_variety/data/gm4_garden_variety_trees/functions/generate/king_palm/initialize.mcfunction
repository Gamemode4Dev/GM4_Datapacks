# initializes the TREE_TYPE tree's AEC marker
# @s = TREE_TYPE generation AEC marker
# run from gm4_garden_variety_trees:generate/king_palm/generation


# set current tree
scoreboard players set king_palm gm4_tree_type 1 

# modify tags
tag @s remove gm4_king_palm_sapling
tag @s remove gm4_gv_sapling

# align and begin generation
execute as @s align xyz positioned ~.5 ~ ~.5 run tp @s ~ ~ ~
execute as @s at @s run function gm4_garden_variety:mechanics/tree_generation/palm_tree/generate
