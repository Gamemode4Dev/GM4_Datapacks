# spawns the tree's palm markers
# @s = TREE_TYPE palm spreader AEC marker
# run from gm4_garden_variety:mechanics/tree_generation/palm_tree/palm_spreader


# [Palm Spreader] caclucate the rate at which the layers need to rotate to create a spiral
scoreboard players operation $leaf_layer_spiral gm4_gv_tree_gen = $palm_separation gm4_gv_tree_gen
scoreboard players operation $leaf_layer_spiral gm4_gv_tree_gen /= $leaf_layers gm4_gv_tree_gen

# [Palm Spreader] calculate x rotation offset for each palm (spiral)
scoreboard players operation $leaf_layer_rotation_spiral_mod gm4_gv_tree_gen = $leaf_layer_spiral gm4_gv_tree_gen
scoreboard players operation $leaf_layer_rotation_spiral_mod gm4_gv_tree_gen *= $current_leaf_layer gm4_gv_tree_gen

# [Palm Spreader] calculate x rotation offset for each palm (alternating)
scoreboard players operation $leaf_layer_rotation_alternate_mod gm4_gv_tree_gen = $palm_separation gm4_gv_tree_gen
scoreboard players operation $leaf_layer_rotation_alternate_mod gm4_gv_tree_gen /= #2 gm4_gv_math_num
scoreboard players operation $leaf_layer_rotation_alternate_mod gm4_gv_tree_gen *= $leaf_layer_eoc2 gm4_gv_tree_gen

# [Palm Spreader] calculate x rotation offset for each palm (random)
function gm4_garden_variety:utility/get/seed/next_value
scoreboard players operation $leaf_layer_rotation_random_mod gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation $leaf_layer_rotation_random_mod gm4_gv_tree_gen %= #360 gm4_gv_math_num

# [Palm Spreader] get x rotation offset for each palm based on mode
execute if score $leaf_layer_rotation_mode gm4_gv_tree_gen matches 0 run scoreboard players operation $palm_rotation_alt_modifier gm4_gv_tree_gen = $leaf_layer_rotation_spiral_mod gm4_gv_tree_gen
execute if score $leaf_layer_rotation_mode gm4_gv_tree_gen matches 1 run scoreboard players operation $palm_rotation_alt_modifier gm4_gv_tree_gen = $leaf_layer_rotation_alternate_mod gm4_gv_tree_gen
execute if score $leaf_layer_rotation_mode gm4_gv_tree_gen matches 2 run scoreboard players operation $palm_rotation_alt_modifier gm4_gv_tree_gen = $leaf_layer_rotation_random_mod gm4_gv_tree_gen

# [Palm Spreader] get initial x rotation offset for each palm
scoreboard players operation $palm_rotation_modified gm4_gv_tree_gen = $palm_separation gm4_gv_tree_gen
scoreboard players operation $palm_rotation_modified gm4_gv_tree_gen *= $palm_spreader_loop gm4_gv_tree_gen
scoreboard players operation $palm_rotation_modified gm4_gv_tree_gen += $palm_offet gm4_gv_tree_gen
scoreboard players operation $palm_rotation_modified gm4_gv_tree_gen += $palm_rotation_alt_modifier gm4_gv_tree_gen
