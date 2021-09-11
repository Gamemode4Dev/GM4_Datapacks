# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from #gm4_garden_variety:mechanics/tree_generation/initialize


# [Initialize] set initial rotation from variables
execute if score $clearance_check_loop gm4_gv_tree_gen = $trunk_layers gm4_gv_tree_gen store result entity @s Rotation[0] float 1 run scoreboard players get $tree_x_rotation gm4_gv_tree_gen
execute if score $clearance_check_loop gm4_gv_tree_gen = $trunk_layers gm4_gv_tree_gen store result entity @s Rotation[1] float 1 run scoreboard players get $tree_y_rotation gm4_gv_tree_gen 
execute if score $clearance_check_loop gm4_gv_tree_gen = $trunk_layers gm4_gv_tree_gen run scoreboard players operation $current_trunk_y_rotation gm4_gv_tree_gen = $tree_y_rotation gm4_gv_tree_gen 

# [Checker] check segment
scoreboard players set $clearance_check_segment_loop gm4_gv_tree_gen 10
execute at @s run function gm4_garden_variety:mechanics/clearance_checker/segment

# [Checker] modify y rotation
scoreboard players operation $current_trunk_y_rotation gm4_gv_tree_gen += $trunk_arc_modifier gm4_gv_tree_gen
execute unless score $minimum_trunk_arc gm4_gv_tree_gen matches 999 if score $current_trunk_y_rotation gm4_gv_tree_gen > $minimum_trunk_arc gm4_gv_tree_gen run scoreboard players operation $current_trunk_y_rotation gm4_gv_tree_gen = $minimum_trunk_arc gm4_gv_tree_gen
execute store result entity @s Rotation[1] float 1 run scoreboard players get $current_trunk_y_rotation gm4_gv_tree_gen

# [Loop]
scoreboard players remove $clearance_check_loop gm4_gv_tree_gen 1
execute if score $clearance_check_loop gm4_gv_tree_gen matches 0 run kill @s[type=!player]
execute if score $clearance_check_loop gm4_gv_tree_gen matches 1.. run function gm4_garden_variety:mechanics/clearance_checker/check


