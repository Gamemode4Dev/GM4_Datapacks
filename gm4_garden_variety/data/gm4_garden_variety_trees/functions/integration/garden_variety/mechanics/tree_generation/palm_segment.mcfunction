# generates the palm segment
# @s = @e[type=marker,tag=gm4_tree_palm_marker]
# at @s
# run from #gm4_garden_variety:mechanics/tree_generation/palm_segment


execute if score king_palm gm4_gv_tree_type matches 1 run function gm4_garden_variety_trees:generate/king_palm/integration/garden_variety/mechanics/tree_generation/palm_segment
