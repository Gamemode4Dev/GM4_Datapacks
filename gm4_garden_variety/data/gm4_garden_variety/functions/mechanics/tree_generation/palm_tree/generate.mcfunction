# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize


# [Initialize] prepare variables for generation
scoreboard players operation $trunk_layer_loop gm4_gv_gen_data = $trunk_layers gm4_gv_gen_data
scoreboard players operation $leaf_layer_loop gm4_gv_gen_data = $leaf_layers gm4_gv_gen_data
scoreboard players set $current_trunk_layer gm4_gv_gen_data 1
scoreboard players set $current_leaf_layer gm4_gv_gen_data 1

# [Generation] pre_generation 
function gm4_garden_variety:mechanics/tree_generation/pre_generation

# [Generation] begin generation 
function gm4_garden_variety:mechanics/tree_generation/palm_tree/trunk

# [Generation] post_generation 
function gm4_garden_variety:mechanics/tree_generation/post_generation

