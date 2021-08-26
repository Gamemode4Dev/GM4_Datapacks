# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from #gm4_garden_variety:mechanics/tree_generation/initialize


# [Initialize] set initial rotation from variables
execute if score $trunk_layer_loop gm4_gv_gen_data = $trunk_layers gm4_gv_gen_data store result entity @s Rotation[0] float 1 run scoreboard players get $tree_x_rotation gm4_gv_gen_data
execute if score $trunk_layer_loop gm4_gv_gen_data = $trunk_layers gm4_gv_gen_data store result entity @s Rotation[1] float 1 run scoreboard players get $tree_y_rotation gm4_gv_gen_data
execute if score $trunk_layer_loop gm4_gv_gen_data = $trunk_layers gm4_gv_gen_data run scoreboard players operation $current_trunk_y_rotation gm4_gv_gen_data = $tree_y_rotation gm4_gv_gen_data

# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "T"
execute if score $debug_generation gm4_gv_gen_data matches 1 at @s positioned ^ ^ ^.5 run particle barrier ~ ~ ~-8

# [Generation] update variables for layer
function gm4_garden_variety:mechanics/interpret_variables/layer/trunk

# [Generation] summon leaf marker and begin generation
execute if score $leaf_start_layer gm4_gv_gen_data = $current_trunk_layer gm4_gv_gen_data at @s run summon marker ~ ~ ~ {Tags:["gm4_tree_leaf_marker"]}
execute if score $leaf_start_layer gm4_gv_gen_data = $current_trunk_layer gm4_gv_gen_data at @s run tp @e[type=marker,tag=gm4_tree_leaf_marker,limit=1,sort=nearest] @s
execute if score $leaf_start_layer gm4_gv_gen_data = $current_trunk_layer gm4_gv_gen_data at @s run execute as @e[type=marker,tag=gm4_tree_leaf_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/tree_generation/palm_tree/leaf

# [Generation] generate trunk layer and move forward (first half)
scoreboard players operation $trunk_segment_loop gm4_gv_gen_data = $trunk_segments_split gm4_gv_gen_data
execute at @s run function #gm4_garden_variety:mechanics/tree_generation/trunk_segment

# [Generation] generate additional features on current layer
execute at @s run function #gm4_garden_variety:mechanics/tree_generation/trunk_layer

# [Generation] generate trunk layer and move forward (second half)
scoreboard players operation $trunk_segment_loop gm4_gv_gen_data = $trunk_segments_split gm4_gv_gen_data
execute at @s run function #gm4_garden_variety:mechanics/tree_generation/trunk_segment
scoreboard players add $current_trunk_layer gm4_gv_gen_data 1

# [Generation] caluclate y rotation, check for minimum, modify y roation
scoreboard players operation $current_trunk_y_rotation gm4_gv_gen_data += $trunk_arc_modifier gm4_gv_gen_data
execute unless score $minimum_trunk_arc gm4_gv_gen_data matches 999 if score $current_trunk_y_rotation gm4_gv_gen_data > $minimum_trunk_arc gm4_gv_gen_data run scoreboard players operation $current_trunk_y_rotation gm4_gv_gen_data = $minimum_trunk_arc gm4_gv_gen_data
execute store result entity @s Rotation[1] float 1 run scoreboard players get $current_trunk_y_rotation gm4_gv_gen_data

# [Loop]
scoreboard players remove $trunk_layer_loop gm4_gv_gen_data 1
execute if score $trunk_layer_loop gm4_gv_gen_data matches 0 run kill @s[type=!player]
execute if score $trunk_layer_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:mechanics/tree_generation/palm_tree/trunk
