# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize


# pre generation 
function gm4_garden_variety:mechanics/tree_generation/pre_generation

# prepare variables for tunk generation
scoreboard players operation $trunk_layer_loop gm4_gv_gen_data = $trunk_layers gm4_gv_gen_data
scoreboard players operation $leaf_layer_loop gm4_gv_gen_data = $leaf_layers gm4_gv_gen_data
scoreboard players set $current_trunk_layer gm4_gv_gen_data 1
scoreboard players set $current_leaf_layer gm4_gv_gen_data 1

# begin trunk generation 
function gm4_garden_variety:mechanics/tree_generation/palm_tree/trunk

# post generation 
function gm4_garden_variety:mechanics/tree_generation/post_generation
