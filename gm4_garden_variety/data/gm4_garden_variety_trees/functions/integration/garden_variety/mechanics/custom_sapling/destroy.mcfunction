# checks whether the sapling is a custom sapling, and if so allows further execution
# @s apple tree sapling AEC
# at @s align xyz
# run from TODO

# drop saplings
execute if entity @s[tag=gm4_king_palm_sapling] run function gm4_garden_variety_trees:generate/king_palm/integration/fruiting_trees/drop_sapling
