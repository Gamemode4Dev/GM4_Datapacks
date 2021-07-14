# initializes the apple tree's marker marker
# @s = raycast marker
# at @s align xyz
# run from gm4_apple_trees:sapling/validate_species

summon marker ~0.5 ~ ~0.5 {CustomName:'"Apple Tree Sapling"',Tags:["gm4_fruiting_sapling","gm4_apple_tree_sapling"]}
scoreboard players set @e[type=marker,tag=gm4_apple_tree_sapling,dx=0] gm4_sap_growth 2
