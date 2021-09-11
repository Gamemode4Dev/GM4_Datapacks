# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize


# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "[SR: "

# [Initialize] interpret input variables
function gm4_garden_variety:mechanics/soil_rooting/interpret_variables/tree

# [Generation] summon marker and begin conversion
scoreboard players set $soil_rooting_current_root gm4_gv_tree_gen 1
scoreboard players operation $soil_rooting_spreader_loop gm4_gv_tree_gen = $soil_rooting_amount gm4_gv_tree_gen
execute at @s align xyz positioned ~.5 ~-.5 ~.5 run summon marker ~ ~ ~ {Tags:["gm4_gv_soil_rooting_spreader_marker"]}
execute at @s run execute as @e[type=marker,tag=gm4_gv_soil_rooting_spreader_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/soil_rooting/rooting_spreader

# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "] "
