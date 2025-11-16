# generates the tree - normal
# @s = sapling marker
# located at @s
# run from generate_tree

# mark sapling and clear the space
function gm4_expanded_trees:mark_sapling

# vanilla
execute if entity @s[tag=gm4_oak_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:oak
execute if entity @s[tag=gm4_acacia_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:acacia
execute if entity @s[tag=gm4_cherry_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:cherry
execute if entity @s[tag=gm4_mangrove_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:mangrove
execute if entity @s[tag=gm4_birch_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:birch

# expanded
execute if entity @s[tag=gm4_pale_oak_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:fancy_oak
execute if entity @s[tag=gm4_dark_oak_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:fancy_oak
