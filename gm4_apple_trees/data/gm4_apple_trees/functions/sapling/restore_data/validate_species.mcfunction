# checks whether the sapling is an apple sapling, and if so allows further execution
# @s apple tree sapling AEC
# at @s align xyz
# run from #gm4_fruiting_trees:sapling/restore_data

execute if entity @s[tag=gm4_apple_tree_sapling] run function gm4_apple_trees:sapling/restore_data/restore
