# generates the tree - mega oak
# @s = sapling marker
# located at @s (offset to be at the negative corner of the 2x2)
# run from generate_tree_type/oak/pick_variant

execute store result score $blocks_moved gm4_towering_trees_data positioned ~-1 ~ ~-1 run clone ~ ~ ~ ~4 ~14 ~4 ~ ~ ~ filtered #gm4_towering_trees:tree_placeable move
execute unless score $blocks_moved gm4_towering_trees_data matches 375 run return fail

execute store result score $blocks_moved gm4_towering_trees_data positioned ~-8 ~3 ~-9 run clone ~ ~ ~ ~19 ~11 ~18 ~ ~ ~ filtered #gm4_towering_trees:tree_placeable move
execute unless score $blocks_moved gm4_towering_trees_data matches 4560 run return fail

execute store result score $tree_rotation gm4_towering_trees_data run random value 1..4
execute if score $tree_rotation gm4_towering_trees_data matches 1 run place template gm4_towering_trees:oak/1 ~-8 ~ ~-9
execute if score $tree_rotation gm4_towering_trees_data matches 2 run place template gm4_towering_trees:oak/1 ~9 ~ ~10 180
execute if score $tree_rotation gm4_towering_trees_data matches 3 run place template gm4_towering_trees:oak/1 ~10 ~ ~-8 clockwise_90
execute if score $tree_rotation gm4_towering_trees_data matches 4 run place template gm4_towering_trees:oak/1 ~-9 ~ ~9 counterclockwise_90

scoreboard players set $tree_placed gm4_towering_trees_data 1
