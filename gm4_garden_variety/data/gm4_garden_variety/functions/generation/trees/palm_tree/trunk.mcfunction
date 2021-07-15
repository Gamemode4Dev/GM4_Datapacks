# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from #gm4_garden_variety:generation/trees/palm_tree/initialize



########## INITIALIZATION ##########

# give advancement
advancement grant @a[distance=..15] only gm4:grow_palm_tree

# debug
data modify storage gm4_garden_variety:debug/generation path append value T

# set initial rotation from variables
execute if score trunk_layer_loop gm4_gv_gen_data = trunk_layers gm4_gv_gen_data store result entity @s Rotation[0] float 1 run scoreboard players get tree_x_rot gm4_gv_gen_data
execute if score trunk_layer_loop gm4_gv_gen_data = trunk_layers gm4_gv_gen_data store result entity @s Rotation[1] float 1 run scoreboard players get tree_y_rot gm4_gv_gen_data 
execute if score trunk_layer_loop gm4_gv_gen_data = trunk_layers gm4_gv_gen_data run scoreboard players operation current_trunk_y_rot gm4_gv_gen_data = tree_y_rot gm4_gv_gen_data 

# update variables for layer
function gm4_garden_variety:generation/interpret_variables/layer/trunk



########## GENERATION ##########

# summon leaf marker and begin generation
execute if score leaf_start gm4_gv_gen_data = current_trunk_layer gm4_gv_gen_data at @s run summon marker ~ ~ ~ {Tags:["gm4_tree_leaf_marker"]}
execute if score leaf_start gm4_gv_gen_data = current_trunk_layer gm4_gv_gen_data at @s run tp @e[type=marker,tag=gm4_tree_leaf_marker,limit=1,sort=nearest] @s
execute if score leaf_start gm4_gv_gen_data = current_trunk_layer gm4_gv_gen_data at @s run execute as @e[type=marker,tag=gm4_tree_leaf_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:generation/trees/palm_tree/leaf

# generate trunk layer and move forward (first half)
scoreboard players operation trunk_segment_loop gm4_gv_gen_data = trunk_segments gm4_gv_gen_data
scoreboard players operation trunk_segment_loop gm4_gv_gen_data /= #2 gm4_gv_math_num
execute if score trunk_layer_loop gm4_gv_gen_data matches 1.. at @s run function #gm4_garden_variety:generation/trees/palm_tree/trunk_segment

# generate additional features on current layer
execute at @s run function #gm4_garden_variety:generation/trees/palm_tree/trunk_layer

# debug
execute if score debug_generation gm4_gv_gen_data matches 1 at @s run particle barrier ~ ~ ~-8
execute if score debug_generation gm4_gv_gen_data matches 1 at @s run particle soul_fire_flame ~ ~ ~10 0 0 0 0 1
execute if score debug_generation gm4_gv_gen_data matches 1 at @s align xyz positioned ~.5 ~.5 ~.5 run particle barrier ~8 ~ ~

# generate trunk layer and move forward (second half)
scoreboard players operation trunk_segment_loop gm4_gv_gen_data = trunk_segments gm4_gv_gen_data
scoreboard players operation trunk_segment_loop gm4_gv_gen_data /= #2 gm4_gv_math_num
execute if score trunk_layer_loop gm4_gv_gen_data matches 1.. at @s run function #gm4_garden_variety:generation/trees/palm_tree/trunk_segment
scoreboard players add current_trunk_layer gm4_gv_gen_data 1



########## FINALIZE ##########

# modify y rotation
scoreboard players operation trunk_y_rot_mod gm4_gv_gen_data = current_trunk_y_rot gm4_gv_gen_data
scoreboard players operation trunk_y_rot_mod gm4_gv_gen_data += trunk_arc_factor gm4_gv_gen_data
scoreboard players operation trunk_y_rot_mod gm4_gv_gen_data += trunk_arc_addition_factor gm4_gv_gen_data
scoreboard players operation current_trunk_y_rot gm4_gv_gen_data = trunk_y_rot_mod gm4_gv_gen_data
execute if score current_trunk_y_rot gm4_gv_gen_data > minimum_trunk_arc gm4_gv_gen_data run scoreboard players operation current_trunk_y_rot gm4_gv_gen_data = minimum_trunk_arc gm4_gv_gen_data
execute store result entity @s Rotation[1] float 1 run scoreboard players get current_trunk_y_rot gm4_gv_gen_data

# loop function until layer_loop hits 0
scoreboard players remove trunk_layer_loop gm4_gv_gen_data 1
execute if score trunk_layer_loop gm4_gv_gen_data matches 0 run kill @s[type=!player]
execute if score trunk_layer_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:generation/trees/palm_tree/trunk


