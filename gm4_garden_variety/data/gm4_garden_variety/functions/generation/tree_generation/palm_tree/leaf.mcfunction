# generates the tree's leaf layers
# @s = TREE_TYPE leaf AEC marker
# run from gm4_garden_variety:generation/tree_generation/palm_tree/trunk


# [Initialize] set initial position and get initial rotation
execute if score $leaf_layer_loop gm4_gv_gen_data = $leaf_layers gm4_gv_gen_data at @s run tp @s ^ ^ ^.1
execute if score $leaf_layer_loop gm4_gv_gen_data = $leaf_layers gm4_gv_gen_data at @s run data get entity @s Rotation[1]

# [Generation] update variables for layer
function gm4_garden_variety:generation/interpret_variables/layer/leaf

# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value " (L:"

# [Generation] summon palm spreader marker and begin generation
scoreboard players operation $palm_spreader_loop gm4_gv_gen_data = $adjusted_palm_amount gm4_gv_gen_data
execute at @s run summon marker ~ ~ ~ {Tags:["gm4_tree_palm_spreader_marker"]}
execute as @e[type=marker,tag=gm4_tree_palm_spreader_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:generation/tree_generation/palm_tree/palm_spreader

# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value ")"

# [Generation] generate leaf layer and move forward (first half)
scoreboard players operation $leaf_segment_loop gm4_gv_gen_data = $leaf_segments_split gm4_gv_gen_data
execute at @s run function #gm4_garden_variety:generation/tree_generation/leaf_segment

# [Generation] generate additional features on current layer
execute at @s run function #gm4_garden_variety:generation/tree_generation/leaf_layer

# [Generation] generate leaf layer and move forward (second half)
scoreboard players operation $leaf_segment_loop gm4_gv_gen_data = $leaf_segments_split gm4_gv_gen_data
execute at @s run function #gm4_garden_variety:generation/tree_generation/leaf_segment
scoreboard players add $current_leaf_layer gm4_gv_gen_data 1

# [Loop]
scoreboard players remove $leaf_layer_loop gm4_gv_gen_data 1
execute if score $leaf_layer_loop gm4_gv_gen_data matches 0 run kill @s
execute if score $leaf_layer_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:generation/tree_generation/palm_tree/leaf


