# generates the roots
# @s = @e[type=marker,tag=gm4_gv_rooting_marker]
# at @s
# run from #gm4_garden_variety:mechanics/soil_rooting/place_block


execute if score king_palm gm4_tree_type matches 1 run function gm4_garden_variety_trees:generate/king_palm/integration/garden_variety/mechanics/soil_rooting/place_block
