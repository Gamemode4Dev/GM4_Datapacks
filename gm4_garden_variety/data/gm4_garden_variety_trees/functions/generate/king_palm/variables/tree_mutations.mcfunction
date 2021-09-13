# modifies the previous variables based on mutations
# @s = @e[type=marker,tag=gm4_gv_sapling,tag=gm4_TREE_TYPE_sapling]
# at @s align xyz
# run from gm4_garden_variety_trees:generate/TREE_TYPE/variables/tree_default

execute if score $fertility gm4_gv_nbt_data matches 3 run scoreboard players add $sapling_leaves_minimum gm4_gv_tree_gen 1
