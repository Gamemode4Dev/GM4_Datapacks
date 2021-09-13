# interprets the palm variables 
# @s = @e[type=marker,tag=gm4_tree_palm_spreader_marker]
# at @s
# run from gm4_garden_variety_trees:generate/TREE_TYPE/integration/garden_variety/mechanics/tree_generation/variables/palm_default


# arc rate for each palm
function gm4_garden_variety:utility/get/seed/next_value
scoreboard players operation $palm_arc gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $palm_arc gm4_gv_tree_gen %= $palm_arc_range gm4_gv_tree_gen
scoreboard players operation $palm_arc gm4_gv_tree_gen += $palm_arc_minimum gm4_gv_tree_gen
execute if score $palm_arc gm4_gv_tree_gen = matches 1000.. run scoreboard players set $palm_arc gm4_gv_tree_gen 0

# x rotation offset for each palm (1-10) (-/+)
function gm4_garden_variety:utility/get/seed/next_value
scoreboard players operation $palm_offet gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $palm_offet gm4_gv_tree_gen %= $palm_offet_range gm4_gv_tree_gen
scoreboard players operation $palm_offet gm4_gv_tree_gen += $palm_offet_minimum gm4_gv_tree_gen
execute if score $palm_offet gm4_gv_tree_gen = matches 1000.. run scoreboard players set $palm_offet gm4_gv_tree_gen 0
function gm4_garden_variety:utility/get/random/sign
scoreboard players operation $palm_offet gm4_gv_tree_gen *= random_sign gm4_gv_math_num

# length of each palm
function gm4_garden_variety:utility/get/seed/next_value
scoreboard players operation $palm_layers gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $palm_layers gm4_gv_tree_gen %= $palm_layers_range gm4_gv_tree_gen
scoreboard players operation $palm_layers gm4_gv_tree_gen += $palm_layers_minimum gm4_gv_tree_gen
execute if score $palm_layers gm4_gv_tree_gen = matches 1000.. run scoreboard players set $palm_layers gm4_gv_tree_gen 0
