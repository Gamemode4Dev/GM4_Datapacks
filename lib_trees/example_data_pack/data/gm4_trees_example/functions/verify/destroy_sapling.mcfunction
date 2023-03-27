# verifies that the sapling type is from this module
# @s = gm4_tree_sapling marker
# located at @s
# run from gm4_trees:sapling/process via #gm4_trees:destroy_sapling

execute if entity @s[tag=gm4_apple_tree_sapling] run function gm4_trees_example:destroy_sapling
# multiple tree type can be checked here
execute if entity @s[tag=gm4_example_tree_sapling2] run function gm4_trees_example:destroy_sapling2
execute if entity @s[tag=gm4_example_tree_sapling3] run function gm4_trees_example:destroy_sapling3
