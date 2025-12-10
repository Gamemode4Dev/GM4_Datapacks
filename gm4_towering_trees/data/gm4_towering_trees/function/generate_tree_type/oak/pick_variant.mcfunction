# generates the tree - mega oak
# @s = sapling marker
# located at @s (offset to be at the negative corner of the 2x2)
# run from generate_mega_tree

execute store result score $tree_variant gm4_towering_trees_data run random value 1..2

execute if score $tree_variant gm4_towering_trees_data matches 1 run function gm4_towering_trees:generate_tree_type/oak/1
execute if score $tree_variant gm4_towering_trees_data matches 2 run function gm4_towering_trees:generate_tree_type/oak/1

execute if score $tree_placed gm4_towering_trees_data matches 1 run fill ~ ~-1 ~ ~1 ~-1 ~1 dirt replace grass_block
