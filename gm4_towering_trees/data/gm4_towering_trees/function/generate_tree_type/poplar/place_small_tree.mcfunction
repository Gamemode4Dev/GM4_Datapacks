# generates the tree - small
# @s = sapling marker
# located at @s
# run from generate_small_tree

execute store result score $poplar_type gm4_towering_trees_data run random value 1..3

execute if score $poplar_type gm4_towering_trees_data matches 1 run return run place feature minecraft:red_poplar
execute if score $poplar_type gm4_towering_trees_data matches 2 run return run place feature minecraft:orange_poplar
execute if score $poplar_type gm4_towering_trees_data matches 3 run return run place feature minecraft:yellow_poplar
