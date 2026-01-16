# Initiates the search for the placed sapling
# @s = player that just placed a custom sapling
# at @s
# run from advancement gm4_trees:place_sapling

advancement revoke @s only gm4_trees:place_sapling

# check for sapling blocks on the looking vector of the player (most likely location)
scoreboard players set $ray gm4_tree_data 500
execute store success score $found_sapling gm4_tree_data anchored eyes positioned ^ ^ ^ run function gm4_trees:sapling/find_sapling

# if no sapling was found, check blocks adjacent to the looking vector
execute unless score $found_sapling gm4_trades_data matches 1 anchored eyes positioned ^ ^ ^ run function gm4_trees:sapling/find_adjacent_sapling
