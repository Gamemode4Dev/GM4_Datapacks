# mark sapling as part of the growing tree
# @s = sapling marker
# located at @s
# run from generate_giant_tree
# run from generate_normal_tree

tag @s add gm4_expanded_trees_sapling.target
execute unless entity @s[tag=gm4_mangrove_tree_sapling] run return run fill ~ ~ ~ ~ ~ ~ air replace #gm4_expanded_trees:supported_sapling
# special case for mangrove_propagule
fill ~ ~ ~ ~ ~ ~ air replace mangrove_propagule[waterlogged=false]
fill ~ ~ ~ ~ ~ ~ water replace mangrove_propagule[waterlogged=true]
