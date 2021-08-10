# initializes the TREE_TYPE tree's AEC marker
# @s = TREE_TYPE generation AEC marker
# run from gm4_natural_trees:generate/king_palm/generation


### INITIALIZE ###

# set current tree
scoreboard players reset * gm4_tree_type
scoreboard players set king_palm gm4_tree_type 1 

# change tags
tag @s remove gm4_king_palm_sapling
tag @s remove gm4_fruiting_sapling
tag @s add gm4_gv_tree_trunk_marker

# delete sapling
fill ~ ~ ~ ~ ~ ~ air replace #minecraft:saplings

# align and begin generation
execute as @s align xyz positioned ~.5 ~ ~.5 run tp @s ~ ~ ~
execute as @s at @s run function gm4_garden_variety:generation/trees/palm_tree/generate

# kill
kill @s

