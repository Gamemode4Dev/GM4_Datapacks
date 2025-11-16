# generates the tree - giant
# @s = sapling marker
# located at @s (offset to be at the negative corner of the 2x2)
# run from generate_tree

# mark saplings and clear the space
execute align xyz as @e[type=marker,tag=gm4_expanded_trees_sapling,limit=4,dx=1,dy=0,dz=1] at @s run function gm4_expanded_trees:mark_sapling

# vanilla
execute if entity @s[tag=gm4_pale_oak_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:pale_oak_bonemeal
execute if entity @s[tag=gm4_dark_oak_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:dark_oak

# expanded
execute if entity @s[tag=gm4_oak_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:mega_spruce
execute if entity @s[tag=gm4_acacia_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:mega_spruce
execute if entity @s[tag=gm4_cherry_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:mega_spruce
execute if entity @s[tag=gm4_mangrove_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:mega_spruce
execute if entity @s[tag=gm4_birch_tree_sapling] store success score $tree_placed gm4_expanded_trees_data run place feature minecraft:mega_spruce
