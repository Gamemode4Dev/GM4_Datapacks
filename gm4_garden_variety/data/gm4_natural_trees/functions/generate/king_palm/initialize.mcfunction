# initializes the TREE_TYPE tree's AEC marker
# @s = TREE_TYPE generation AEC marker
# run from gm4_natural_trees:generate/king_palm/generation


# [Initialize] set current tree
scoreboard players reset * gm4_tree_type
scoreboard players set king_palm gm4_tree_type 1 

# [Initialize] change tags
tag @s remove gm4_king_palm_sapling
tag @s remove gm4_fruiting_sapling
tag @s add gm4_gv_tree_trunk_marker

# [Initialize] delete sapling
fill ~ ~ ~ ~ ~ ~ air replace #minecraft:saplings

# [Generation] align and begin generation
execute as @s align xyz positioned ~.5 ~ ~.5 run tp @s ~ ~ ~
execute as @s at @s run function gm4_garden_variety:generation/tree_generation/palm_tree/generate

# [Finalize] 
kill @s

