# generates variables for the tree based on the current seed
# run from gm4_garden_variety_trees:generate/palm_tree/TREE_TYPE/generate


# [Trunk] initial x rotation for the tree
scoreboard players set $tree_x_rotation_minimum gm4_gv_gen_data 1
scoreboard players set $tree_x_rotation_range gm4_gv_gen_data 360

# [Trunk] initial y rotation for the tree
scoreboard players set $tree_y_rotation_minimum gm4_gv_gen_data 81
scoreboard players set $tree_y_rotation_range gm4_gv_gen_data 10

# [Trunk] amount of trunk layers for the tree
scoreboard players set $trunk_layers_minimum gm4_gv_gen_data 9
scoreboard players set $trunk_layers_range gm4_gv_gen_data 3

# [Trunk] amount of segments in a trunk layer for the tree
scoreboard players set $trunk_segments gm4_gv_gen_data 10

# [Trunk] arc rate for the trunk layers
scoreboard players set $minimum_trunk_arc gm4_gv_gen_data -40
scoreboard players set $trunk_arc_rate gm4_gv_gen_data 1
scoreboard players set $trunk_arc_amount gm4_gv_gen_data 1
scoreboard players set $trunk_arc_addition_rate gm4_gv_gen_data 0
scoreboard players set $trunk_arc_addition_amount gm4_gv_gen_data 0

# [Leaf] amount of leaf layers for the tree
scoreboard players set $leaf_layers_minimum gm4_gv_gen_data 2
scoreboard players set $leaf_layers_range gm4_gv_gen_data 1

# [Leaf] layer at which leafs start to generate on the trunk
scoreboard players set $leaf_layer_start_minimum gm4_gv_gen_data 1
scoreboard players set $leaf_layer_start_range gm4_gv_gen_data 2
scoreboard players set $leaf_layer_start_side gm4_gv_gen_data 1

# [Leaf] amount of segments in a leaf layer for the tree
scoreboard players set $leaf_segments gm4_gv_gen_data 2

# [Leaf] leaf layer progression mode (0 = Spiral, 1 = Alternating, 2 = Random)
scoreboard players set $leaf_layer_rotation_mode gm4_gv_gen_data 1

# [Palm] amount of palms for the tree
scoreboard players set $palm_amount_minimum gm4_gv_gen_data 5
scoreboard players set $palm_amount_range gm4_gv_gen_data 3

# [Palm] minimum palm amount for the tree
scoreboard players set $minimum_palm_amount gm4_gv_gen_data 3

# [Palm] amount of segments in a palm layer for the tree
scoreboard players set $palm_segments gm4_gv_gen_data 10

# [Palm] rate at which palm amount is reduced
scoreboard players set $palm_reduction_rate gm4_gv_gen_data 1
scoreboard players set $palm_reduction_amount gm4_gv_gen_data 0

# [Palm] x rotation offset for each palm (different for each palm)
scoreboard players set $palm_offet_minimum gm4_gv_gen_data 1
scoreboard players set $palm_offet_range gm4_gv_gen_data 10

# [Sapling Leaves] amount of leaves that contain a sapling
scoreboard players set $sapling_leaves_start_layer gm4_gv_gen_data 1
scoreboard players set $sapling_leaves_minimum gm4_gv_gen_data 1
scoreboard players set $sapling_leaves_range gm4_gv_gen_data 1
scoreboard players set $sapling_leaves_layer_chance gm4_gv_gen_data 10

# [Fruit Leaves] amount of leaves that may contain fruit
scoreboard players set $fruit_leaves_chance gm4_gv_gen_data 4
scoreboard players set $fruit_leaves_minimum gm4_gv_gen_data 1
scoreboard players set $fruit_leaves_range gm4_gv_gen_data 2

# [Trunk Fruit] general settings
scoreboard players set $trunk_fruit_start_height gm4_gv_gen_data 4
scoreboard players set $trunk_fruit_block_chance gm4_gv_gen_data 2
scoreboard players set $trunk_fruit_per_layer gm4_gv_gen_data 2

# [Soil Conversion] general settings (certain combinations can result in repetetive patterns)
scoreboard players set $enable_soil_conversion gm4_gv_gen_data 1
scoreboard players set $soil_conversion_radius gm4_gv_gen_data 3
scoreboard players set $soil_conversion_block_chance gm4_gv_gen_data 40
scoreboard players set $soil_conversion_max gm4_gv_gen_data 10

# [Soil Rooting] enable soil rooting
scoreboard players set $enable_soil_rooting gm4_gv_gen_data 1

# [Soil Rooting] the amount of individual roots generated
scoreboard players set $soil_rooting_amount_minimum gm4_gv_gen_data 2
scoreboard players set $soil_rooting_amount_range gm4_gv_gen_data 2

# [Soil Rooting] the length at which each root can be set (different for each root)
scoreboard players set $soil_rooting_root_length_minimum gm4_gv_gen_data 2
scoreboard players set $soil_rooting_root_length_range gm4_gv_gen_data 3

# [Soil Rooting] the x rotation at which the soil rooting spreader will start
scoreboard players set $soil_rooting_x_rotation_minimum gm4_gv_gen_data 1
scoreboard players set $soil_rooting_x_rotation_range gm4_gv_gen_data 360

# [Soil Rooting] the y rotation at which each root can be set (different for each root)
scoreboard players set $soil_rooting_y_rotation_minimum gm4_gv_gen_data 55
scoreboard players set $soil_rooting_y_rotation_range gm4_gv_gen_data 15

# [Soil Rooting] give a random offset for each root
scoreboard players set $soil_rooting_x_rotation_offset_minimum gm4_gv_gen_data 1
scoreboard players set $soil_rooting_x_rotation_offset_range gm4_gv_gen_data 10

# [Mutations] apply mutation modifications
function gm4_garden_variety_trees:generate/king_palm/variables/tree_mutations

# [Interpret] convert input variables to generation variables
function gm4_garden_variety:mechanics/interpret_variables/initial/tree
