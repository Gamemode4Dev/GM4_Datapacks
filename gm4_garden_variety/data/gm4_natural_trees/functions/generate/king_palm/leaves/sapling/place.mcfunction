# places sapling leaf marker
# run from gm4_natural_trees:generate/king_palm/generation/decoration/fruit_leaf/attempt

# debug
data modify storage gm4_garden_variety:debug/generation path append value "s"

# place leaf block
setblock ~ ~ ~ birch_leaves[persistent=true] replace 
execute align xyz positioned ~0.5 ~ ~0.5 run function gm4_natural_trees:generate/king_palm/integration/fruiting_trees/sapling_leaf/generate
scoreboard players remove $sapling_leaves gm4_gv_gen_data 1
