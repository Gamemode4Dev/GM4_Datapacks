# initializes the apple tree's marker marker
# @s = raycast marker
# at @s align xyz positioned ~0.5 ~0.5 ~0.5
# run from gm4_apple_trees:sapling/validate_species

summon marker ~ ~ ~ {CustomName:'"Apple Tree Sapling"',Tags:["gm4_fruiting_sapling","gm4_apple_tree_sapling"]}
scoreboard players set @e[type=marker,tag=gm4_apple_tree_sapling,distance=..0.1] gm4_sap_growth 2
