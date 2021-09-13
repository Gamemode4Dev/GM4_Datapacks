# interprets the leaf variables
# @s = @e[type=marker,tag=gm4_tree_leaf_marker]
# at @s
# run from gm4_garden_variety:mechanics/tree_generation/TREE_TYPE/leaf


# [Leaf] count every other layer by a factor of 2
scoreboard players operation $leaf_layer_eoc2 gm4_gv_tree_gen = $leaf_layer_loop gm4_gv_tree_gen
scoreboard players operation $leaf_layer_eoc2 gm4_gv_tree_gen /= #2 gm4_gv_math_num

# [Leaf] find the palm amount reduction factor
scoreboard players operation $leaf_layer_eoc_prr gm4_gv_tree_gen = $current_leaf_layer gm4_gv_tree_gen
scoreboard players remove $leaf_layer_eoc_prr gm4_gv_tree_gen 1
scoreboard players operation $leaf_layer_eoc_prr gm4_gv_tree_gen /= $palm_reduction_rate gm4_gv_tree_gen
scoreboard players operation $palm_amount_reduction_factor gm4_gv_tree_gen = $palm_reduction_amount gm4_gv_tree_gen
scoreboard players operation $palm_amount_reduction_factor gm4_gv_tree_gen *= $leaf_layer_eoc_prr gm4_gv_tree_gen

# [Leaf] apply the palm reduction factor
scoreboard players operation $adjusted_palm_amount gm4_gv_tree_gen = $palm_amount gm4_gv_tree_gen
execute if score $adjusted_palm_amount gm4_gv_tree_gen >= $minimum_palm_amount gm4_gv_tree_gen run scoreboard players operation $adjusted_palm_amount gm4_gv_tree_gen -= $palm_amount_reduction_factor gm4_gv_tree_gen

# [Leaf] calculate an even amount of space between palms
scoreboard players operation $palm_separation gm4_gv_tree_gen = #360 gm4_gv_math_num
scoreboard players operation $palm_separation gm4_gv_tree_gen /= $adjusted_palm_amount gm4_gv_tree_gen