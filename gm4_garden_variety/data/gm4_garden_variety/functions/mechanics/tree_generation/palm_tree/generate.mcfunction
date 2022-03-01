# starts generating the tree
# @s = @e[type=marker,tag=gm4_tree_trunk_marker]
# at @s
# run from gm4_garden_variety_trees:generate/TREE_TYPE/initialize

# [Pre-Generation]
function gm4_garden_variety:mechanics/tree_generation/pre_generation

# [Trunk] prepare variables for tunk generation
scoreboard players operation $trunk_layer_loop gm4_gv_tree_gen = $trunk_layers gm4_gv_tree_gen
scoreboard players operation $leaf_layer_loop gm4_gv_tree_gen = $leaf_layers gm4_gv_tree_gen
scoreboard players set $current_trunk_layer gm4_gv_tree_gen 1
scoreboard players set $current_leaf_layer gm4_gv_tree_gen 1

# [Trunk] set initial rotation from variables
execute store result entity @s Rotation[0] float 1 run scoreboard players get $tree_x_rotation gm4_gv_tree_gen
execute store result entity @s Rotation[1] float 1 run scoreboard players get $tree_y_rotation gm4_gv_tree_gen
scoreboard players operation $current_trunk_y_rotation gm4_gv_tree_gen = $tree_y_rotation gm4_gv_tree_gen

# [Trunk] begin trunk generation 
data modify storage gm4_garden_variety:debug/generation path append value "TL:("
function gm4_garden_variety:mechanics/tree_generation/palm_tree/trunk
data modify storage gm4_garden_variety:debug/generation path append value ") "

# [Leaves] begin leaf generation (marker spawned in trunk)
data modify storage gm4_garden_variety:debug/generation path append value "LL:("
execute as @e[type=marker,tag=gm4_tree_leaf_marker] at @s run function gm4_garden_variety:mechanics/tree_generation/palm_tree/leaf
data modify storage gm4_garden_variety:debug/generation path append value ")"

# [Post-Generation]
function gm4_garden_variety:mechanics/tree_generation/post_generation
