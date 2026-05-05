# replaces this sapling if the tree could not be placed
# @s = sapling marker
# at @s
# run from generate_mega_tree
# run from generate_small_tree

execute if entity @s[tag=gm4_oak_tree_sapling] run setblock ~ ~ ~ oak_sapling[stage=0]
execute if entity @s[tag=gm4_acacia_tree_sapling] run setblock ~ ~ ~ acacia_sapling[stage=0]
execute if entity @s[tag=gm4_cherry_tree_sapling] run setblock ~ ~ ~ cherry_sapling[stage=0]
execute if entity @s[tag=gm4_mangrove_tree_sapling.waterlogged] run setblock ~ ~ ~ mangrove_propagule[stage=0,age=4,waterlogged=true]
execute if entity @s[tag=!gm4_mangrove_tree_sapling.waterlogged,tag=gm4_mangrove_tree_sapling] run setblock ~ ~ ~ mangrove_propagule[stage=0,age=4,waterlogged=false]
execute if entity @s[tag=gm4_birch_tree_sapling] run setblock ~ ~ ~ birch_sapling[stage=0]
execute if entity @s[tag=gm4_pale_oak_tree_sapling] run setblock ~ ~ ~ pale_oak_sapling[stage=0]
execute if entity @s[tag=gm4_dark_oak_tree_sapling] run setblock ~ ~ ~ dark_oak_sapling[stage=0]
