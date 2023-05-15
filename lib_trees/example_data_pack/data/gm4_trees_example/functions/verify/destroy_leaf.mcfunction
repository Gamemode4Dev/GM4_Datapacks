# verifies that the leaf type is from this module
# @s = gm4_tree_leaf marker
# located at @s
# run from gm4_trees:tick via #gm4_trees:destroy_leaf

execute if entity @s[tag=gm4_apple_leaf] run function gm4_trees_example:destroy_leaf
# multiple tree type can be checked here
execute if entity @s[tag=gm4_example_leaf2] run function gm4_trees_example:destroy_leaf2
execute if entity @s[tag=gm4_example_leaf3] run function gm4_trees_example:destroy_leaf3
