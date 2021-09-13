# places the trunk decor
# @s = @e[type=marker,tag=gm4_trunk_decor_marker]
# at @s
# run from gm4_garden_variety:mechanics/trunk_decor/layer


# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "d"

# place fruit
scoreboard players remove $fruit_leaves gm4_gv_tree_gen 1
function #gm4_garden_variety:mechanics/trunk_decor/place_block

