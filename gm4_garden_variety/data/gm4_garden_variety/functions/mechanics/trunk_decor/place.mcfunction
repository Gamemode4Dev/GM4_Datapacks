# places fruit leaf
# run from gm4_garden_variety_trees:generate/king_palm/generation/decoration/fruit_leaf/attempt


# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "d"

# [Generation] place fruit
scoreboard players remove $fruit_leaves gm4_gv_tree_gen 1
function #gm4_garden_variety:mechanics/trunk_decor/place_block

