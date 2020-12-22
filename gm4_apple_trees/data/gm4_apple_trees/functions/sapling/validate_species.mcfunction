# checks whether the placed sapling is an apple sapling, and if so allows further execution
# @s raycast AEC
# at @s align xyz
# run from #gm4_fruiting_trees:sapling/initialize

execute if data storage gm4_fruiting_trees:data Sapling{type:"apple"} run function gm4_apple_trees:sapling/initialize
