# checks whether the sapling is a custom sapling, and if so allows further execution
# @s apple tree sapling AEC
# at @s align xyz
# run from TODO

execute if entity @s[tag=gm4_king_palm_sapling] run function gm4_natural_trees:generate/king_palm/integration/fruiting_trees/drop_sapling
