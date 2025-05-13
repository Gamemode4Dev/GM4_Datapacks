# Initiates the search for the placed sapling
# @s = player that just placed a custom sapling
# at @s
# run from advancement gm4_trees:place_sapling

advancement revoke @s only gm4_trees:place_sapling

scoreboard players set $ray gm4_tree_data 500
execute anchored eyes positioned ^ ^ ^ run function gm4_trees:sapling/find_sapling
