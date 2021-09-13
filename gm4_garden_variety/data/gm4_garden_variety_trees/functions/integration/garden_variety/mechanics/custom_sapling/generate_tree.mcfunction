# generates the tree from a fully grown sapling
# @s = @e[type=marker,tag=gm4_gv_sapling]
# at @s align xyz
# run from #gm4_garden_variety:mechanics/custom_sapling/generate_tree


# grow sapling
execute if entity @s[tag=gm4_king_palm_sapling] run function gm4_garden_variety_trees:generate/king_palm/generate
