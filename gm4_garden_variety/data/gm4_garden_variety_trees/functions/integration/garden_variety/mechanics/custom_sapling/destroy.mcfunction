# processes the sapling that has been broken
# @s = @e[type=marker,tag=gm4_gv_sapling]
# at @s align xyz
# run from #gm4_garden_variety:mechanics/custom_sapling/destroy


# drop saplings
execute if entity @s[tag=gm4_king_palm_sapling] run function gm4_garden_variety_trees:generate/king_palm/integration/fruiting_trees/drop_sapling
