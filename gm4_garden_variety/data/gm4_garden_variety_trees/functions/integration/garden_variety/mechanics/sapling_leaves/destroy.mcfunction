# processes the leaf that has been broken
# @s = @e[type=marker,tag=gm4_gv_sapling_leaf]
# at @s align xyz
# run from #gm4_garden_variety:mechanics/custom_sapling/destroy


# drop saplings
execute if entity @s[tag=gm4_king_palm_sapling_leaf] run function gm4_garden_variety_trees:generate/king_palm/sapling_leaf/destroy
