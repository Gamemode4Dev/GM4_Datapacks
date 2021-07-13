# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from #gm4_garden_variety:generation/trees/palm_tree/initialize



########## INITIALIZATION ##########

# set initial rotation from variables
execute if score clearance_check_loop gm4_gv_gen_data = trunk_layers gm4_gv_gen_data store result entity @s Rotation[0] float 1 run scoreboard players get tree_x_rot gm4_gv_gen_data
execute if score clearance_check_loop gm4_gv_gen_data = trunk_layers gm4_gv_gen_data store result entity @s Rotation[1] float 1 run scoreboard players get tree_y_rot gm4_gv_gen_data 
execute if score clearance_check_loop gm4_gv_gen_data = trunk_layers gm4_gv_gen_data run scoreboard players operation current_trunk_y_rot gm4_gv_gen_data = tree_y_rot gm4_gv_gen_data 



########## CHECK CLEARANCE ##########

# check segment
scoreboard players set clearance_check_segment_loop gm4_gv_gen_data 10
execute at @s run function gm4_garden_variety:generation/clearance_checker/segment

# modify y rotation
scoreboard players operation trunk_y_rot_mod gm4_gv_gen_data = current_trunk_y_rot gm4_gv_gen_data
scoreboard players operation trunk_y_rot_mod gm4_gv_gen_data += trunk_arc_factor gm4_gv_gen_data
scoreboard players operation trunk_y_rot_mod gm4_gv_gen_data += trunk_arc_addition_factor gm4_gv_gen_data
scoreboard players operation current_trunk_y_rot gm4_gv_gen_data = trunk_y_rot_mod gm4_gv_gen_data
execute if score current_trunk_y_rot gm4_gv_gen_data > minimum_trunk_arc gm4_gv_gen_data run scoreboard players operation current_trunk_y_rot gm4_gv_gen_data = minimum_trunk_arc gm4_gv_gen_data
execute store result entity @s Rotation[1] float 1 run scoreboard players get current_trunk_y_rot gm4_gv_gen_data

# loop function until layer_loop hits 0
scoreboard players remove clearance_check_loop gm4_gv_gen_data 1
execute if score clearance_check_loop gm4_gv_gen_data matches 0 run kill @s[type=!player]
execute if score clearance_check_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:generation/clearance_checker/check


