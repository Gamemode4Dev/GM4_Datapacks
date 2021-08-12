# generates variables for the tree based on the current seed
# run from gm4_natural_trees:generate/palm_tree/TREE_TYPE/generate



### TRUNK ###

# initial x rotation for the tree (1-360)
scoreboard players set $tree_x_rotation_minimum gm4_gv_gen_data 1
scoreboard players set $tree_x_rotation_range gm4_gv_gen_data 360

# initial y rotation for the tree (81-90)
scoreboard players set $tree_y_rotation_minimum gm4_gv_gen_data 81
scoreboard players set $tree_y_rotation_range gm4_gv_gen_data 10

# amount of trunk layers for the tree (9-11)
scoreboard players set $trunk_layers_minimum gm4_gv_gen_data 9
scoreboard players set $trunk_layers_range gm4_gv_gen_data 3

# amount of segments in a trunk layer for the tree (10)
scoreboard players set $trunk_segments gm4_gv_gen_data 10

# arc rate for the trunk layers (1,0,0)
scoreboard players set $minimum_trunk_arc gm4_gv_gen_data -40
scoreboard players set $trunk_arc_rate gm4_gv_gen_data 1
scoreboard players set $trunk_arc_amount gm4_gv_gen_data 1
scoreboard players set $trunk_arc_addition_rate gm4_gv_gen_data 0
scoreboard players set $trunk_arc_addition_amount gm4_gv_gen_data 0


### LEAF ###

# amount of leaf layers for the tree (2)
scoreboard players set $leaf_layers_minimum gm4_gv_gen_data 2
scoreboard players set $leaf_layers_range gm4_gv_gen_data 1

# layer at which leafs start to generate on the trunk (1-2,1)
scoreboard players set $leaf_layer_start_minimum gm4_gv_gen_data 1
scoreboard players set $leaf_layer_start_range gm4_gv_gen_data 2
scoreboard players set $leaf_layer_start_side gm4_gv_gen_data 1

# amount of segments in a leaf layer for the tree (2)
scoreboard players set $leaf_segments gm4_gv_gen_data 2

# leaf layer progression mode (1) (0 = Spiral, 1 = Alternating, 2 = Random)
scoreboard players set $leaf_layer_rotation_mode gm4_gv_gen_data 1


### PALM ###

# amount of palms for the tree (5-7)
scoreboard players set $palm_amount_minimum gm4_gv_gen_data 5
scoreboard players set $palm_amount_range gm4_gv_gen_data 3

# minimum palm amount for the tree (3)
scoreboard players set $minimum_palm_amount gm4_gv_gen_data 3

# amount of segments in a palm layer for the tree (10)
scoreboard players set $palm_segments gm4_gv_gen_data 10

# rate at which palm amount is reduced (1,0)
scoreboard players set $palm_reduction_rate gm4_gv_gen_data 1
scoreboard players set $palm_reduction_amount gm4_gv_gen_data 0


### OTHER ###

# amount of leaves that contain a sapling (1, 20)
scoreboard players set $sapling_leaves_start_layer gm4_gv_gen_data 1
scoreboard players set $sapling_leaves_minimum gm4_gv_gen_data 1
scoreboard players set $sapling_leaves_range gm4_gv_gen_data 1
scoreboard players set $sapling_leaves_layer_chance gm4_gv_gen_data 10

# amount of leaves that may contain fruit (1, 25%)
scoreboard players set $fruit_leaves_chance gm4_gv_gen_data 4
scoreboard players set $fruit_leaves_minimum gm4_gv_gen_data 1
scoreboard players set $fruit_leaves_range gm4_gv_gen_data 2
scoreboard players set $trunk_fruit_start_height gm4_gv_gen_data 3
scoreboard players set $trunk_fruit_block_chance gm4_gv_gen_data 2
scoreboard players set $trunk_fruit_per_layer gm4_gv_gen_data 2

# soil conversion
scoreboard players set $enable_soil_conversion gm4_gv_gen_data 1
scoreboard players set $soil_conversion_radius gm4_gv_gen_data 3
scoreboard players set $soil_conversion_block_chance gm4_gv_gen_data 40
scoreboard players set $soil_conversion_max gm4_gv_gen_data 10
# rooting
scoreboard players set $enable_rooting gm4_gv_gen_data 1


### FINALIZE ###

# apply mutation override variables
#TODO# function gm4_natural_trees:generate/king_palm/generation/trees/variables/tree_mutation_override

# convert input variables to generation variables
function gm4_garden_variety:generation/interpret_variables/initial/tree
