# generates the tree's palm layers
# @s = caranday palm palm AEC marker
# run from gm4_garden_variety:mechanics/tree_generation/palm_tree/palm


# [Palm] identify every other layer by a factor of 2 (math)
scoreboard players operation $palm_layer_eo2 gm4_gv_tree_gen = $palm_layer_eo2 gm4_gv_tree_gen
scoreboard players operation $palm_layer_eo2 gm4_gv_tree_gen %= #2 gm4_gv_math_num

# [Palm] find the palm arc reduction factor (math)
scoreboard players operation $palm_layer_eoc_paar gm4_gv_tree_gen = $current_palm_layer gm4_gv_tree_gen
scoreboard players remove $palm_layer_eoc_paar gm4_gv_tree_gen 1
scoreboard players operation $palm_layer_eoc_paar gm4_gv_tree_gen /= $palm_arc_addition_rate gm4_gv_tree_gen
scoreboard players operation $palm_arc_addition_factor gm4_gv_tree_gen = $palm_arc_addition_amount gm4_gv_tree_gen
scoreboard players operation $palm_arc_addition_factor gm4_gv_tree_gen *= $palm_layer_eoc_paar gm4_gv_tree_gen

# [Palm] combine arc and arc_addition_factor
scoreboard players operation $palm_arc_modifier gm4_gv_tree_gen = $palm_arc gm4_gv_tree_gen
scoreboard players operation $palm_arc_modifier gm4_gv_tree_gen += $palm_arc_addition_factor gm4_gv_tree_gen
