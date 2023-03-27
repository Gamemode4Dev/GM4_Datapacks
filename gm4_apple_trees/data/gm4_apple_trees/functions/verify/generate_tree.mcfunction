# verifies that the module is enabled and that the sapling type is from this module
# @s = gm4_tree_sapling marker
# located at @s
# run from gm4_trees-1.0:advance_stage via #gm4_trees:generate_tree

execute if score gm4_apple_trees load.status matches 1.. if entity @s[tag=gm4_apple_tree_sapling] run function gm4_apple_trees:sapling/generate_tree
