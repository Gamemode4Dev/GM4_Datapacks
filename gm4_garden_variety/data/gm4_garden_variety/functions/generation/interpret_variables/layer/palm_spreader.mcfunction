# spawns the tree's palm markers
# @s = TREE_TYPE palm spreader AEC marker
# run from gm4_garden_variety:generation/trees/palm_tree/palm_spreader



# caclucate the rate at which the layers need to rotate to create a spiral
scoreboard players operation $leaf_layer_spiral gm4_gv_gen_data = $palm_separation gm4_gv_gen_data
scoreboard players operation $leaf_layer_spiral gm4_gv_gen_data /= $leaf_layers gm4_gv_gen_data

# calculate x rotation offset for each palm (spiral)
scoreboard players operation $leaf_layer_rot_spiral_mod gm4_gv_gen_data = $leaf_layer_spiral gm4_gv_gen_data
scoreboard players operation $leaf_layer_rot_spiral_mod gm4_gv_gen_data *= $current_leaf_layer gm4_gv_gen_data

# calculate x rotation offset for each palm (alternating)
scoreboard players operation $leaf_layer_rot_alternate_mod gm4_gv_gen_data = $palm_separation gm4_gv_gen_data
scoreboard players operation $leaf_layer_rot_alternate_mod gm4_gv_gen_data /= #2 gm4_gv_math_num
scoreboard players operation $leaf_layer_rot_alternate_mod gm4_gv_gen_data *= $leaf_layer_eoc2 gm4_gv_gen_data

# calculate x rotation offset for each palm (random)
function gm4_garden_variety:data/generate/next_seed_value
scoreboard players operation $leaf_layer_rot_random_mod gm4_gv_gen_data = $current_seed gm4_gv_gen_data
scoreboard players operation $leaf_layer_rot_random_mod gm4_gv_gen_data %= #360 gm4_gv_math_num

# get x rotation offset for each palm based on mode
execute if score $leaf_layer_rotation_mode gm4_gv_gen_data matches 0 run scoreboard players operation $palm_rot_alt_modifier gm4_gv_gen_data = $leaf_layer_rot_spiral_mod gm4_gv_gen_data
execute if score $leaf_layer_rotation_mode gm4_gv_gen_data matches 1 run scoreboard players operation $palm_rot_alt_modifier gm4_gv_gen_data = $leaf_layer_rot_alternate_mod gm4_gv_gen_data
execute if score $leaf_layer_rotation_mode gm4_gv_gen_data matches 2 run scoreboard players operation $palm_rot_alt_modifier gm4_gv_gen_data = $leaf_layer_rot_random_mod gm4_gv_gen_data

# get initial x rotation offset for each palm
scoreboard players operation $palm_rot_modifier gm4_gv_gen_data = $palm_separation gm4_gv_gen_data
scoreboard players operation $palm_rot_modifier gm4_gv_gen_data *= $palm_spreader_loop gm4_gv_gen_data
scoreboard players operation $palm_rot_modifier gm4_gv_gen_data += $palm_offet gm4_gv_gen_data
scoreboard players operation $palm_rot_modifier gm4_gv_gen_data += $palm_rot_alt_modifier gm4_gv_gen_data
