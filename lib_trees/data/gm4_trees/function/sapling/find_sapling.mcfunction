# ray cast to find sapling
# @s = player that placed a custom sapling
# at a position along a ray originating from the player's eyes
# run from gm4_trees:sapling/place_sapling

# check blocks on looking vector
execute if block ~ ~ ~ #minecraft:saplings align xyz unless entity @e[tag=smithed.block,dx=0,limit=1] run return run function gm4_trees:sapling/summon_marker

# runs the loop again
scoreboard players remove $ray gm4_tree_data 1
execute if score $ray gm4_tree_data matches 0.. positioned ^ ^ ^0.013 run return run function gm4_trees:sapling/find_sapling
execute unless score $ray gm4_tree_data matches 0.. run return fail
