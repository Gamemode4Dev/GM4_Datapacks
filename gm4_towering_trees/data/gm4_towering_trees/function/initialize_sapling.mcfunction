# initializes the vanilla tree's marker
# @s = player who placed down the vanilla tree sapling
# located at the center of the placed sapling
# run from verify/initialize_sapling

# summon marker
# spruce and jungle are not included as they already have both variants of tree
execute if block ~ ~ ~ oak_sapling run summon marker ~ ~ ~ {CustomName:"gm4_oak_tree_sapling",Tags:["gm4_tree_sapling","gm4_towering_trees_sapling","gm4_oak_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
execute if block ~ ~ ~ birch_sapling run summon marker ~ ~ ~ {CustomName:"gm4_birch_tree_sapling",Tags:["gm4_tree_sapling","gm4_towering_trees_sapling","gm4_birch_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
execute if block ~ ~ ~ acacia_sapling run summon marker ~ ~ ~ {CustomName:"gm4_acacia_tree_sapling",Tags:["gm4_tree_sapling","gm4_towering_trees_sapling","gm4_acacia_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
execute if block ~ ~ ~ dark_oak_sapling run summon marker ~ ~ ~ {CustomName:"gm4_dark_oak_tree_sapling",Tags:["gm4_tree_sapling","gm4_towering_trees_sapling","gm4_dark_oak_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
execute if block ~ ~ ~ cherry_sapling run summon marker ~ ~ ~ {CustomName:"gm4_cherry_tree_sapling",Tags:["gm4_tree_sapling","gm4_towering_trees_sapling","gm4_cherry_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
execute if block ~ ~ ~ pale_oak_sapling run summon marker ~ ~ ~ {CustomName:"gm4_pale_oak_tree_sapling",Tags:["gm4_tree_sapling","gm4_towering_trees_sapling","gm4_pale_oak_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
execute if block ~ ~ ~ mangrove_propagule run summon marker ~ ~ ~ {CustomName:"gm4_mangrove_tree_sapling",Tags:["gm4_tree_sapling","gm4_towering_trees_sapling","gm4_mangrove_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
# set stage requirement (higher = longer to grow)
scoreboard players set @e[type=marker,tag=gm4_towering_trees_sapling,distance=..0.1] gm4_sap_growth 2
