# initilizes the root generator
# @s = @e[type=marker,tag=gm4_tree_trunk_marker]
# at @s
# run from gm4_garden_variety:mechanics/tree_generation/pre_generation


# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "[SR: "

# interpret input variables
function gm4_garden_variety:mechanics/soil_rooting/interpret_variables/initial_root

# summon marker and begin conversion
scoreboard players set $soil_rooting_current_root gm4_gv_tree_gen 1
scoreboard players operation $soil_rooting_spreader_loop gm4_gv_tree_gen = $soil_rooting_amount gm4_gv_tree_gen
execute at @s align xyz positioned ~.5 ~-.5 ~.5 run summon marker ~ ~ ~ {Tags:["gm4_gv_soil_rooting_spreader_marker"]}
execute at @s run execute as @e[type=marker,tag=gm4_gv_soil_rooting_spreader_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/soil_rooting/rooting_spreader

# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "] "
