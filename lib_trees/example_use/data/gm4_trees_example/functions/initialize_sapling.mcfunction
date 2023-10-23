# initializes the example tree's marker
# @s = player who placed down the example tree sapling
# located at the center of the placed sapling
# run from gm4_trees:example:verify/initialize_sapling

# summon marker
summon marker ~ ~ ~ {CustomName:'"gm4_apple_tree_sapling"',Tags:["gm4_tree_sapling","gm4_apple_tree_sapling","smithed.entity","smithed.strict","smithed.block"]}
# set stage requirement (higher = longer to grow)
scoreboard players set @e[type=marker,tag=gm4_apple_tree_sapling,distance=..0.1] gm4_sap_growth 2
