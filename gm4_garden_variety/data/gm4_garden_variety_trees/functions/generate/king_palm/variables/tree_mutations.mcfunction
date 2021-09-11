# generates variables for the tree based on the current seed
# run from gm4_garden_variety_trees:generate/palm_tree/TREE_TYPE/generate

execute if score $fertility gm4_gv_nbt_data matches 3 run scoreboard players add $sapling_leaves_minimum gm4_gv_tree_gen 1
