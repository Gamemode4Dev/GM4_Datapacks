# updates the placed custom sapling block
# @s = player that just placed a custom sapling
# located at @s
# run from advancement gm4_trees:place_sapling

advancement revoke @s only gm4_trees:place_sapling

scoreboard players set $ray gm4_tree_data 50
scoreboard players set $found gm4_tree_data 0
execute anchored eyes positioned ^ ^ ^ run function gm4_trees:sapling/ray

scoreboard players set $ray gm4_tree_data 50
execute if score $found gm4_tree_data matches 0 anchored eyes positioned ^ ^ ^ run function gm4_trees:sapling/ray_fuzzy
