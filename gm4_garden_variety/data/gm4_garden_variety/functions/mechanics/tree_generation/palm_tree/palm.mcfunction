# generates the tree's palm layers
# @s = caranday palm palm AEC marker
# run from gm4_garden_variety:mechanics/tree_generation/palm_tree/palm_spreader


# [Initialize] get initial rotation
execute if score $palm_layer_loop gm4_gv_gen_data = $palm_layers gm4_gv_gen_data store result score $current_palm_y_rotation gm4_gv_gen_data run data get entity @s Rotation[1]

# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "."
execute if score $debug_generation gm4_gv_gen_data matches 1 at @s positioned ^ ^ ^.5 run particle light ~ ~ ~-8

# [Generation] update variables for layer
function gm4_garden_variety:mechanics/tree_generation/interpret_variables/layer/palm

# [Generation] generate palm segment and move forward (first half)
scoreboard players operation $palm_segment_loop gm4_gv_gen_data = $palm_segments_split gm4_gv_gen_data
execute at @s run function #gm4_garden_variety:mechanics/tree_generation/palm_segment

# [Generation] generate additional features on current layer
execute at @s run function #gm4_garden_variety:mechanics/tree_generation/palm_layer

# [Generation] generate palm segment and move forward (second half)
scoreboard players operation $palm_segment_loop gm4_gv_gen_data = $palm_segments_split gm4_gv_gen_data
execute at @s run function #gm4_garden_variety:mechanics/tree_generation/palm_segment
scoreboard players add $current_palm_layer gm4_gv_gen_data 1

# [Generation] modify y rotation
scoreboard players operation $current_palm_y_rotation gm4_gv_gen_data += $palm_arc_modifier gm4_gv_gen_data
execute store result entity @s Rotation[1] float 1 run scoreboard players get $current_palm_y_rotation gm4_gv_gen_data

# [Loop]
scoreboard players remove $palm_layer_loop gm4_gv_gen_data 1
execute if score $palm_layer_loop gm4_gv_gen_data matches 0 run kill @s
execute if score $palm_layer_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:mechanics/tree_generation/palm_tree/palm
