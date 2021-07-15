# generates variables for the tree based on the current seed
# run from gm4_natural_trees:generate/palm_tree/TREE_TYPE/generate



########## TRUNK ##########

# initial x rotation for the tree
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation tree_x_rot gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation tree_x_rot gm4_gv_gen_data %= tree_x_rot_range gm4_gv_gen_data
scoreboard players operation tree_x_rot gm4_gv_gen_data += tree_x_rot_minimum gm4_gv_gen_data
execute if score tree_x_rot gm4_gv_gen_data matches 1000.. run scoreboard players set tree_x_rot gm4_gv_gen_data 0

# initial y rotation for the tree
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation tree_y_rot gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation tree_y_rot gm4_gv_gen_data %= tree_y_rot_range gm4_gv_gen_data
scoreboard players operation tree_y_rot gm4_gv_gen_data += tree_y_rot_minimum gm4_gv_gen_data
execute if score tree_y_rot gm4_gv_gen_data matches 1.. run scoreboard players operation tree_y_rot gm4_gv_gen_data *= #-1 gm4_gv_math_num
execute if score tree_y_rot gm4_gv_gen_data = matches 1000.. run scoreboard players set tree_y_rot gm4_gv_gen_data 0

# amount of trunk layers for the tree
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation trunk_layers gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation trunk_layers gm4_gv_gen_data %= trunk_layers_range gm4_gv_gen_data
scoreboard players operation trunk_layers gm4_gv_gen_data += trunk_layers_minimum gm4_gv_gen_data
execute if score trunk_layers gm4_gv_gen_data = matches 1000.. run scoreboard players set trunk_layers gm4_gv_gen_data 0



########## LEAF ##########

# amount of leaf layers for the tree
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation leaf_layers gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation leaf_layers gm4_gv_gen_data %= leaf_layers_range gm4_gv_gen_data
scoreboard players operation leaf_layers gm4_gv_gen_data += leaf_layers_minimum gm4_gv_gen_data
execute if score leaf_layers gm4_gv_gen_data = matches 1000.. run scoreboard players set leaf_layers gm4_gv_gen_data 0

# layer at which leafs start to generate on the trunk
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation leaf_layer_start gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation leaf_layer_start gm4_gv_gen_data %= leaf_layer_start_range gm4_gv_gen_data
scoreboard players operation leaf_layer_start gm4_gv_gen_data += leaf_layer_start_minimum gm4_gv_gen_data
execute if score leaf_layer_start gm4_gv_gen_data = matches 1000.. run scoreboard players set leaf_layer_start gm4_gv_gen_data 0

# trunk layer at which leaves will begin generating
execute if score leaf_layer_start_side gm4_gv_gen_data matches 1 run scoreboard players operation leaf_start gm4_gv_gen_data = trunk_layers gm4_gv_gen_data
execute if score leaf_layer_start_side gm4_gv_gen_data matches 1 run scoreboard players operation leaf_start gm4_gv_gen_data -= leaf_layer_start gm4_gv_gen_data
execute if score leaf_layer_start_side gm4_gv_gen_data matches 1 run scoreboard players add leaf_start gm4_gv_gen_data 1
execute if score leaf_layer_start_side gm4_gv_gen_data matches 0 run scoreboard players operation leaf_start gm4_gv_gen_data = leaf_layer_start gm4_gv_gen_data



########## PALM ##########

# amount of palms for the tree 
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation palm_amount gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation palm_amount gm4_gv_gen_data %= palm_amount_range gm4_gv_gen_data
scoreboard players operation palm_amount gm4_gv_gen_data += palm_amount_minimum gm4_gv_gen_data
execute if score palm_amount gm4_gv_gen_data = matches 1000.. run scoreboard players set palm_amount gm4_gv_gen_data 0



########## DECORATION ##########

# amount of leaves that contain a sapling
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation sapling_leaves gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation sapling_leaves gm4_gv_gen_data %= sapling_leaves_range gm4_gv_gen_data
scoreboard players operation sapling_leaves gm4_gv_gen_data += sapling_leaves_minimum gm4_gv_gen_data
execute if score sapling_leaves gm4_gv_gen_data = matches 1000.. run scoreboard players set sapling_leaves gm4_gv_gen_data 0

# amount of leaves that may contain fruit
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation fruit_leaves_success gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation fruit_leaves_success gm4_gv_gen_data %= fruit_leaves_chance gm4_gv_gen_data
function gm4_garden_variety:data/get/next_seed_value
scoreboard players operation fruit_leaves gm4_gv_gen_data = current_seed gm4_gv_gen_data
scoreboard players operation fruit_leaves gm4_gv_gen_data %= fruit_leaves_range gm4_gv_gen_data
scoreboard players operation fruit_leaves gm4_gv_gen_data += fruit_leaves_minimum gm4_gv_gen_data
execute if score fruit_leaves gm4_gv_gen_data = matches 1000.. run scoreboard players set fruit_leaves gm4_gv_gen_data 0
execute unless score fruit_leaves_success gm4_gv_gen_data matches 0 run scoreboard players set fruit_leaves gm4_gv_gen_data 0
