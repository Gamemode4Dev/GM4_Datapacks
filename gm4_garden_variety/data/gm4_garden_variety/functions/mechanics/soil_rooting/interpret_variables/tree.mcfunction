# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize


# [Soil Rooting] initial x rotation for the roots
function gm4_garden_variety:utility/generate/next_seed_value
scoreboard players operation $soil_rooting_initial_x_rotation gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $soil_rooting_initial_x_rotation gm4_gv_tree_gen %= $soil_rooting_x_rotation_range gm4_gv_tree_gen
scoreboard players operation $soil_rooting_initial_x_rotation gm4_gv_tree_gen += $soil_rooting_x_rotation_minimum gm4_gv_tree_gen

# [Soil Rooting] amount of roots under the tree
function gm4_garden_variety:utility/generate/next_seed_value
scoreboard players operation $soil_rooting_amount gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $soil_rooting_amount gm4_gv_tree_gen %= $soil_rooting_amount_range gm4_gv_tree_gen
scoreboard players operation $soil_rooting_amount gm4_gv_tree_gen += $soil_rooting_amount_minimum gm4_gv_tree_gen
execute if score $soil_rooting_amount gm4_gv_tree_gen = matches 1000.. run scoreboard players set $soil_rooting_amount gm4_gv_tree_gen 0

# [Soil Rooting] calculate an even amount of space between roots
scoreboard players operation $palm_separation gm4_gv_tree_gen = #360 gm4_gv_math_num
scoreboard players operation $palm_separation gm4_gv_tree_gen /= $soil_rooting_amount gm4_gv_tree_gen
