# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize


# [Soil Rooting] get y rotation for the root
function gm4_garden_variety:data/generate/next_seed_value
scoreboard players operation $soil_rooting_y_rotation gm4_gv_gen_data = $current_seed gm4_gv_gen_data
scoreboard players operation $soil_rooting_y_rotation gm4_gv_gen_data %= $soil_rooting_y_rotation_range gm4_gv_gen_data
scoreboard players operation $soil_rooting_y_rotation gm4_gv_gen_data += $soil_rooting_y_rotation_minimum gm4_gv_gen_data
execute if score $soil_rooting_y_rotation gm4_gv_gen_data matches ..-1 run scoreboard players operation $soil_rooting_y_rotation gm4_gv_gen_data *= #-1 gm4_gv_math_num
execute store result entity @s Rotation[1] float 1 run scoreboard players get $soil_rooting_y_rotation gm4_gv_gen_data

# [Soil Rooting] get depth for root
function gm4_garden_variety:data/generate/next_seed_value
scoreboard players operation $soil_rooting_root_length gm4_gv_gen_data = $current_seed gm4_gv_gen_data
scoreboard players operation $soil_rooting_root_length gm4_gv_gen_data %= $soil_rooting_root_length_range gm4_gv_gen_data
scoreboard players operation $soil_rooting_root_length gm4_gv_gen_data += $soil_rooting_root_length_minimum gm4_gv_gen_data

# [Soil Rooting] initial x rotation for the roots
function gm4_garden_variety:data/generate/next_seed_value
scoreboard players operation $soil_rooting_x_rotation_offset gm4_gv_gen_data = $current_seed gm4_gv_gen_data
scoreboard players operation $soil_rooting_x_rotation_offset gm4_gv_gen_data %= $soil_rooting_x_rotation_offset_range gm4_gv_gen_data
scoreboard players operation $soil_rooting_x_rotation_offset gm4_gv_gen_data += $soil_rooting_x_rotation_offset_minimum gm4_gv_gen_data

# [Soil Rooting] set x rotation
scoreboard players operation $soil_rooting_x_rotation gm4_gv_gen_data = $soil_rooting_current_root gm4_gv_gen_data
scoreboard players operation $soil_rooting_x_rotation gm4_gv_gen_data *= $palm_separation gm4_gv_gen_data
scoreboard players operation $soil_rooting_x_rotation gm4_gv_gen_data += $soil_rooting_initial_x_rotation gm4_gv_gen_data
scoreboard players operation $soil_rooting_x_rotation gm4_gv_gen_data += $soil_rooting_x_rotation_offset gm4_gv_gen_data

