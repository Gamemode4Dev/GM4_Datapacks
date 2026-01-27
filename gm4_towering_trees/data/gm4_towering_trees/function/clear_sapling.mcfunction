# removes this sapling so features can be placed
# @s = sapling marker
# at @s
# run from generate_mega_tree
# run from generate_small_tree

execute if block ~ ~ ~ mangrove_propagule[waterlogged=true] run tag @s add gm4_mangrove_tree_sapling.waterlogged
execute unless entity @s[tag=gm4_mangrove_tree_sapling.waterlogged] run fill ~ ~ ~ ~ ~ ~ air replace #gm4_towering_trees:supported_sapling
execute if entity @s[tag=gm4_mangrove_tree_sapling.waterlogged] run setblock ~ ~ ~ water
