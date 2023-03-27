# verifies that the sapling type is from this module
# @s = gm4_tree_sapling marker
# located at @s
# run from gm4_trees:advance_stage via #gm4_trees:generate_tree

execute if entity @s[tag=gm4_apple_tree_sapling] run function gm4_trees_example:generate_tree
# multiple tree type can be checked here
execute if entity @s[tag=gm4_example_tree_sapling2] run function gm4_trees_example:generate_tree2
execute if entity @s[tag=gm4_example_tree_sapling3] run function gm4_trees_example:generate_tree3
