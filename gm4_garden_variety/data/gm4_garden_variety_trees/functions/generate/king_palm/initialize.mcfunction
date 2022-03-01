# initializes the trees generation
# @s = @e[type=marker,tag=gm4_gv_sapling,tag=gm4_TREE_TYPE_sapling]
# at @s align xyz
# run from gm4_garden_variety_trees:generate/TREE_TYPE/generate


# set current tree
scoreboard players set king_palm gm4_gv_tree_type 1 

# modify tags
tag @s remove gm4_king_palm_sapling
tag @s remove gm4_gv_sapling
tag @s add gm4_tree_trunk_marker

# align and begin generation
execute as @s align xyz positioned ~.5 ~ ~.5 run tp @s ~ ~ ~
execute as @s at @s run function gm4_garden_variety:mechanics/tree_generation/palm_tree/generate
