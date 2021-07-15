# generates the tree's leaf layers
# @s = TREE_TYPE leaf AEC marker
# run from gm4_garden_variety:generation/trees/palm_tree/leaf



# count every other layer by a factor of 2
scoreboard players operation leaf_layer_eoc2 gm4_gv_gen_data = leaf_layer_loop gm4_gv_gen_data
scoreboard players operation leaf_layer_eoc2 gm4_gv_gen_data /= #2 gm4_gv_math_num

# caclucate the rate at which the layers need to rotate to create a spiral
scoreboard players operation leaf_layer_spiral gm4_gv_gen_data = palm_separation gm4_gv_gen_data
scoreboard players operation leaf_layer_spiral gm4_gv_gen_data /= leaf_layers gm4_gv_gen_data

# find the palm amount reduction factor
scoreboard players operation leaf_layer_eoc_parr gm4_gv_gen_data = current_leaf_layer gm4_gv_gen_data
scoreboard players remove leaf_layer_eoc_parr gm4_gv_gen_data 1
scoreboard players operation leaf_layer_eoc_parr gm4_gv_gen_data /= palm_reduction_rate gm4_gv_gen_data
scoreboard players operation palm_amount_reduction_factor gm4_gv_gen_data = palm_reduction_amount gm4_gv_gen_data
scoreboard players operation palm_amount_reduction_factor gm4_gv_gen_data *= leaf_layer_eoc_parr gm4_gv_gen_data

# apply the palm reduction factor
scoreboard players operation adjusted_palm_amount gm4_gv_gen_data = palm_amount gm4_gv_gen_data
execute if score adjusted_palm_amount gm4_gv_gen_data >= minimum_palm_amount gm4_gv_gen_data run scoreboard players operation adjusted_palm_amount gm4_gv_gen_data -= palm_amount_reduction_factor gm4_gv_gen_data

# calculate an even amount of space between palms
scoreboard players operation palm_separation gm4_gv_gen_data = #360 gm4_gv_math_num
scoreboard players operation palm_separation gm4_gv_gen_data /= adjusted_palm_amount gm4_gv_gen_data