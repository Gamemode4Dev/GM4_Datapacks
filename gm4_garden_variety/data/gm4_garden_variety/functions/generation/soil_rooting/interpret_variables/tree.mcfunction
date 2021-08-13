# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize


# [Soil Rooting] initial x rotation for the roots
function gm4_garden_variety:data/generate/next_seed_value
scoreboard players operation $soil_rooting_initial_x_rotation gm4_gv_gen_data = $current_seed gm4_gv_gen_data
scoreboard players operation $soil_rooting_initial_x_rotation gm4_gv_gen_data %= $soil_rooting_x_rotation_range gm4_gv_gen_data
scoreboard players operation $soil_rooting_initial_x_rotation gm4_gv_gen_data += $soil_rooting_x_rotation_minimum gm4_gv_gen_data

# [Soil Rooting] amount of roots under the tree
function gm4_garden_variety:data/generate/next_seed_value
scoreboard players operation $soil_rooting_amount gm4_gv_gen_data = $current_seed gm4_gv_gen_data
scoreboard players operation $soil_rooting_amount gm4_gv_gen_data %= $soil_rooting_amount_range gm4_gv_gen_data
scoreboard players operation $soil_rooting_amount gm4_gv_gen_data += $soil_rooting_amount_minimum gm4_gv_gen_data
execute if score $soil_rooting_amount gm4_gv_gen_data = matches 1000.. run scoreboard players set $soil_rooting_amount gm4_gv_gen_data 0

# [Soil Rooting] calculate an even amount of space between roots
scoreboard players operation $palm_separation gm4_gv_gen_data = #360 gm4_gv_math_num
scoreboard players operation $palm_separation gm4_gv_gen_data /= $soil_rooting_amount gm4_gv_gen_data
