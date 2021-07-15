# generates the tree's palm layers
# @s = caranday palm palm AEC marker
# run from gm4_garden_variety:generation/trees/palm_tree/palm_spreader



########## INITIALIZATION ##########

# debug
data modify storage gm4_garden_variety:debug/generation path append value "."

# get initial rotation
execute if score palm_layer_loop gm4_gv_gen_data = palm_layers gm4_gv_gen_data store result score current_palm_y_rot gm4_gv_gen_data run data get entity @s Rotation[1]

# update variables for layer
function gm4_garden_variety:generation/interpret_variables/layer/palm




########## GENERATION ##########

# generate palm segment and move forward (first half)
scoreboard players operation palm_segment_loop gm4_gv_gen_data = palm_segments gm4_gv_gen_data
scoreboard players operation palm_segment_loop gm4_gv_gen_data /= #2 gm4_gv_math_num
execute at @s run function #gm4_garden_variety:generation/trees/palm_tree/palm_segment

# generate additional features on current layer
execute at @s run function #gm4_garden_variety:generation/trees/palm_tree/palm_layer

# debug
execute if score debug_generation gm4_gv_gen_data matches 1 at @s run particle dragon_breath ~ ~ ~10

# generate palm segment and move forward (second half)
scoreboard players operation palm_segment_loop gm4_gv_gen_data = palm_segments gm4_gv_gen_data
scoreboard players operation palm_segment_loop gm4_gv_gen_data /= #2 gm4_gv_math_num
execute at @s run function #gm4_garden_variety:generation/trees/palm_tree/palm_segment
scoreboard players add current_palm_layer gm4_gv_gen_data 1



########## FINALIZE ##########

# modify y rotation
scoreboard players operation palm_y_rot_mod gm4_gv_gen_data = current_palm_y_rot gm4_gv_gen_data
scoreboard players operation palm_y_rot_mod gm4_gv_gen_data += palm_arc gm4_gv_gen_data
scoreboard players operation palm_y_rot_mod gm4_gv_gen_data += palm_arc_addition_factor gm4_gv_gen_data
scoreboard players operation current_palm_y_rot gm4_gv_gen_data = palm_y_rot_mod gm4_gv_gen_data
execute store result entity @s Rotation[1] float 1 run scoreboard players get current_palm_y_rot gm4_gv_gen_data

# loop function until palm_layer_loop hits 0
scoreboard players remove palm_layer_loop gm4_gv_gen_data 1
execute if score palm_layer_loop gm4_gv_gen_data matches 0 run kill @s
execute if score palm_layer_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:generation/trees/palm_tree/palm