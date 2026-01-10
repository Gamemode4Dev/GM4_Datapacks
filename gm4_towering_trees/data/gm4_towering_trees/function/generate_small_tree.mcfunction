# generates the tree - small
# @s = sapling marker
# located at @s
# run from generate_tree

# remove sapling to clear the space
function gm4_towering_trees:clear_sapling

# vanilla
execute if entity @s[tag=gm4_oak_tree_sapling] store success score $tree_placed gm4_towering_trees_data run place feature minecraft:oak
execute if entity @s[tag=gm4_acacia_tree_sapling] store success score $tree_placed gm4_towering_trees_data run place feature minecraft:acacia
execute if entity @s[tag=gm4_cherry_tree_sapling] store success score $tree_placed gm4_towering_trees_data run place feature minecraft:cherry
execute if entity @s[tag=gm4_mangrove_tree_sapling] store success score $tree_placed gm4_towering_trees_data run place feature minecraft:mangrove
execute if entity @s[tag=gm4_birch_tree_sapling] store success score $tree_placed gm4_towering_trees_data run place feature minecraft:birch

# towering
execute if entity @s[tag=gm4_pale_oak_tree_sapling] store success score $tree_placed gm4_towering_trees_data run function gm4_towering_trees:generate_tree_type/pale_oak/pick_variant
execute if entity @s[tag=gm4_dark_oak_tree_sapling] store success score $tree_placed gm4_towering_trees_data run function gm4_towering_trees:generate_tree_type/dark_oak/pick_variant

# replace sapling if placement failed
execute if score $tree_placed gm4_towering_trees_data matches 0 run function gm4_towering_trees:replace_sapling
