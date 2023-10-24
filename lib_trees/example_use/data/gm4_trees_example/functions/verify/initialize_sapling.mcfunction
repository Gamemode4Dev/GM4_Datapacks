# verifies that the sapling type is from this module
# @s = player who just placed down a custom sapling
# located at the center sapling block
# run from gm4_trees:sapling/summon marker via #gm4_trees:initialize_sapling

execute if data storage gm4_trees:temp sapling{type:"apple"} run function gm4_trees_example:initialize_sapling
# multiple tree type can be checked here
execute if data storage gm4_trees:temp sapling{type:"example2"} run function gm4_trees_example:initialize_sapling2
execute if data storage gm4_trees:temp sapling{type:"example3"} run function gm4_trees_example:initialize_sapling3
