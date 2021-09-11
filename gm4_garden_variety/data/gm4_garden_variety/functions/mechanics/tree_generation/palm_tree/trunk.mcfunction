# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from #gm4_garden_variety:mechanics/tree_generation/initialize


# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "T"
execute if score $debug_generation gm4_gv_tree_gen matches 1 at @s positioned ^ ^ ^.5 run particle barrier ~ ~ ~-8

# update variables for layer
function gm4_garden_variety:mechanics/tree_generation/interpret_variables/layer/trunk

# summon leaf marker
execute if score $leaf_start_layer gm4_gv_tree_gen = $current_trunk_layer gm4_gv_tree_gen at @s run data modify storage gm4_garden_variety:debug/generation path append value "l"
execute if score $leaf_start_layer gm4_gv_tree_gen = $current_trunk_layer gm4_gv_tree_gen at @s run summon marker ~ ~ ~ {Tags:["gm4_tree_leaf_marker"]}
execute if score $leaf_start_layer gm4_gv_tree_gen = $current_trunk_layer gm4_gv_tree_gen at @s run tp @e[type=marker,tag=gm4_tree_leaf_marker,limit=1,sort=nearest] @s

# generate trunk layer and move forward (first half)
scoreboard players operation $trunk_segment_loop gm4_gv_tree_gen = $trunk_segments_split gm4_gv_tree_gen
execute at @s run function #gm4_garden_variety:mechanics/tree_generation/trunk_segment

# generate additional features on current layer
execute at @s run function #gm4_garden_variety:mechanics/tree_generation/trunk_layer

# generate trunk layer and move forward (second half)
scoreboard players operation $trunk_segment_loop gm4_gv_tree_gen = $trunk_segments_split gm4_gv_tree_gen
execute at @s run function #gm4_garden_variety:mechanics/tree_generation/trunk_segment
scoreboard players add $current_trunk_layer gm4_gv_tree_gen 1

# caluclate y rotation, check for minimum, modify y roation
scoreboard players operation $current_trunk_y_rotation gm4_gv_tree_gen += $trunk_arc_modifier gm4_gv_tree_gen
execute unless score $minimum_trunk_arc gm4_gv_tree_gen matches 999 if score $current_trunk_y_rotation gm4_gv_tree_gen > $minimum_trunk_arc gm4_gv_tree_gen run scoreboard players operation $current_trunk_y_rotation gm4_gv_tree_gen = $minimum_trunk_arc gm4_gv_tree_gen
execute store result entity @s Rotation[1] float 1 run scoreboard players get $current_trunk_y_rotation gm4_gv_tree_gen

# [Loop]
scoreboard players remove $trunk_layer_loop gm4_gv_tree_gen 1
execute if score $trunk_layer_loop gm4_gv_tree_gen matches 0 run kill @s[type=!player]
execute if score $trunk_layer_loop gm4_gv_tree_gen matches 1.. run function gm4_garden_variety:mechanics/tree_generation/palm_tree/trunk
