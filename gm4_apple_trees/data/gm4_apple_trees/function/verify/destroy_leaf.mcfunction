# verifies that the module is enabled and that the leaf type is from this module
# @s = gm4_tree_leaf marker
# located at @s
# run from gm4_trees-1.0:tick via #gm4_trees:destroy_leaf

execute if score gm4_apple_trees load.status matches 1.. if entity @s[tag=gm4_apple_leaf] run function gm4_apple_trees:leaf/destroy
execute if score gm4_apple_trees load.status matches 1.. if entity @s[tag=gm4_golden_apple_leaf] run function gm4_golden_apple_trees:leaf/destroy
