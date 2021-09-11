# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_garden_variety:mechanics/tree_generation/palm_tree/trunk


# [Trunk] identify every other layer by a factor of 2
scoreboard players operation $trunk_layer_eo2 gm4_gv_tree_gen = $trunk_layer_loop gm4_gv_tree_gen
scoreboard players operation $trunk_layer_eo2 gm4_gv_tree_gen %= #2 gm4_gv_math_num

# [Trunk] find the trunk arc factor
scoreboard players operation $trunk_layer_eo_tar gm4_gv_tree_gen = $current_trunk_layer gm4_gv_tree_gen
scoreboard players operation $trunk_layer_eo_tar gm4_gv_tree_gen %= $trunk_arc_rate gm4_gv_tree_gen
execute if score $trunk_layer_eo_tar gm4_gv_tree_gen matches 1.. run scoreboard players set $trunk_arc_factor gm4_gv_tree_gen 0
execute if score $trunk_layer_eo_tar gm4_gv_tree_gen matches 0 run scoreboard players operation $trunk_arc_factor gm4_gv_tree_gen = $trunk_arc_amount gm4_gv_tree_gen

# [Trunk] find the trunk arc addition factor
scoreboard players operation $trunk_layer_eoc_taar gm4_gv_tree_gen = $current_trunk_layer gm4_gv_tree_gen
scoreboard players remove $trunk_layer_eoc_taar gm4_gv_tree_gen 1
scoreboard players operation $trunk_layer_eoc_taar gm4_gv_tree_gen /= $trunk_arc_addition_rate gm4_gv_tree_gen
scoreboard players operation $trunk_arc_addition_factor gm4_gv_tree_gen = $trunk_arc_addition_amount gm4_gv_tree_gen
scoreboard players operation $trunk_arc_addition_factor gm4_gv_tree_gen *= $trunk_layer_eoc_taar gm4_gv_tree_gen

# [Trunk] combine arc_factor and arc_addition_factor
scoreboard players operation $trunk_arc_modifier gm4_gv_tree_gen = $trunk_arc_factor gm4_gv_tree_gen
scoreboard players operation $trunk_arc_modifier gm4_gv_tree_gen += $trunk_arc_addition_factor gm4_gv_tree_gen
