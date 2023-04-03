# verifies that the module is enabled and that the sapling type is from this module
# @s = gm4_tree_sapling marker
# located at world spawn
# run from gm4_trees-1.0:tick via #gm4_trees:upgrade_fruiting_to_general

execute if score gm4_apple_trees load.status matches 1.. if entity @s[tag=gm4_apple_tree_sapling] run function gm4_apple_trees:upgrade_path/fruiting_to_general
