# places fruit leaf
# run from gm4_natural_trees:generate/king_palm/generation/decoration/fruit_leaf/attempt

# debug
data modify storage gm4_garden_variety:debug/generation path append value "f"

# place fruit
scoreboard players remove $fruit_leaves gm4_gv_gen_data 1
function #gm4_garden_variety:generation/trunk_fruit/place

