# checks whether @s is an apple sapling, and if so allows further execution
# @s any gm4_fruiting_sapling
# at @s align xyz
# run from #gm4_fruiting_trees:tree/layer/generate

execute if entity @s[tag=gm4_apple_sapling] run function gm4_apple_trees:tree/layer/generate
