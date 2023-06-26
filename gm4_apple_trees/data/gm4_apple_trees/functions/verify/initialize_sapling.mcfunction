# verifies that the module is enabled and that the sapling type is from this module
# @s = player who just placed down a custom sapling
# located at the center sapling block
# run from gm4_trees-1.0:sapling/summon marker via #gm4_trees:initialize_sapling

execute if score gm4_apple_trees load.status matches 1.. if data storage gm4_trees:temp sapling{type:"apple"} run function gm4_apple_trees:sapling/initialize
