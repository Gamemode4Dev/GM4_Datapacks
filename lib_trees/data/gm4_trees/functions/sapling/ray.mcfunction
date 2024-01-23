# ray cast to find sapling
# @s = player that placed a custom sapling
# at @s anchored eyes positioned ^ ^ ^0.X where X = step count
# run from gm4_trees:sapling/place_sapling

# check block
execute store success score $found gm4_tree_data align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[tag=smithed.block,distance=..0.5,limit=1] run function gm4_trees:sapling/summon_marker

# runs the loop again
scoreboard players remove $ray gm4_tree_data 1
execute unless score $found gm4_tree_data matches 1 if score $ray gm4_tree_data matches 1.. positioned ^ ^ ^0.1 run function gm4_trees:sapling/ray
