# generates the tree - small
# @s = sapling marker
# located at @s
# run from generate_tree

# remove sapling to clear the space
execute if block ~ ~ ~ mangrove_propagule[waterlogged=true] run tag @s add gm4_mangrove_tree_sapling.waterlogged
execute unless entity @s[tag=gm4_mangrove_tree_sapling.waterlogged] run fill ~ ~ ~ ~ ~ ~ air replace #gm4_towering_trees:supported_sapling
execute if entity @s[tag=gm4_mangrove_tree_sapling.waterlogged] run setblock ~ ~ ~ water

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
execute if score $tree_placed gm4_towering_trees_data matches 1 run return 1
execute if entity @s[tag=gm4_oak_tree_sapling] run setblock ~ ~ ~ oak_sapling[stage=0]
execute if entity @s[tag=gm4_acacia_tree_sapling] run setblock ~ ~ ~ acacia_sapling[stage=0]
execute if entity @s[tag=gm4_cherry_tree_sapling] run setblock ~ ~ ~ cherry_sapling[stage=0]
execute if entity @s[tag=gm4_mangrove_tree_sapling.waterlogged] run setblock ~ ~ ~ mangrove_propagule[stage=0,age=4,waterlogged=true]
execute if entity @s[tag=!gm4_mangrove_tree_sapling.waterlogged,tag=!gm4_mangrove_tree_sapling] run setblock ~ ~ ~ mangrove_propagule[stage=0,age=4,waterlogged=false]
execute if entity @s[tag=gm4_birch_tree_sapling] run setblock ~ ~ ~ birch_sapling[stage=0]
execute if entity @s[tag=gm4_pale_oak_tree_sapling] run setblock ~ ~ ~ pale_oak_sapling[stage=0]
execute if entity @s[tag=gm4_dark_oak_tree_sapling] run setblock ~ ~ ~ dark_oak_sapling[stage=0]
