# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_garden_variety:generation/trees/palm_tree/trunk

# find the trunk arc factor
scoreboard players operation trunk_layer_eo_tar gm4_gv_gen_data = current_trunk_layer gm4_gv_gen_data
scoreboard players operation trunk_layer_eo_tar gm4_gv_gen_data %= trunk_arc_rate gm4_gv_gen_data
execute if score trunk_layer_eo_tar gm4_gv_gen_data matches 1.. run scoreboard players set trunk_arc_factor gm4_gv_gen_data 0
execute if score trunk_layer_eo_tar gm4_gv_gen_data matches 0 run scoreboard players operation trunk_arc_factor gm4_gv_gen_data = trunk_arc_amount gm4_gv_gen_data

# find the trunk arc addition factor (math)
scoreboard players operation trunk_layer_eoc_taar gm4_gv_gen_data = current_trunk_layer gm4_gv_gen_data
scoreboard players remove trunk_layer_eoc_taar gm4_gv_gen_data 1
scoreboard players operation trunk_layer_eoc_taar gm4_gv_gen_data /= trunk_arc_addition_rate gm4_gv_gen_data
scoreboard players operation trunk_arc_addition_factor gm4_gv_gen_data = trunk_arc_addition_amount gm4_gv_gen_data
scoreboard players operation trunk_arc_addition_factor gm4_gv_gen_data *= trunk_layer_eoc_taar gm4_gv_gen_data

# identify every other layer by a factor of 2 (math)
scoreboard players operation trunk_layer_eo2 gm4_gv_gen_data = trunk_layer_loop gm4_gv_gen_data
scoreboard players operation trunk_layer_eo2 gm4_gv_gen_data %= #2 gm4_gv_math_num

# get 1/2 of the trees layers (math)
scoreboard players operation trunk_layers_half gm4_gv_gen_data = trunk_layers gm4_gv_gen_data
scoreboard players operation trunk_layers_half gm4_gv_gen_data /= #2 gm4_gv_math_num




