# verifies that the sapling type is from this module
# @s = gm4_tree_sapling marker
# located at @s
# run from gm4_trees:advance_stage via #gm4_trees:generate_tree

execute if entity @s[tag=gm4_towering_trees_sapling] run function gm4_towering_trees:generate_tree
