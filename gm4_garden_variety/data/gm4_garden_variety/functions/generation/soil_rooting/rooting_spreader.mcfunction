# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize


# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "R"

# [Initialize] interpret input variables
function gm4_garden_variety:generation/soil_rooting/interpret_variables/root

# [Generation] summon marker and begin conversion
scoreboard players operation $soil_rooting_loop gm4_gv_gen_data = $soil_rooting_root_length gm4_gv_gen_data
execute at @s positioned ~ ~-.5 ~ run summon marker ~ ~ ~ {Tags:["gm4_gv_rooting_marker"]}
execute at @s run tp @e[type=marker,tag=gm4_gv_rooting_marker,limit=1,sort=nearest] @s
execute at @s run execute as @e[type=marker,tag=gm4_gv_rooting_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:generation/soil_rooting/soil_rooter

# [Generation] set rotation from variables
execute store result entity @s Rotation[0] float 1 run scoreboard players get $soil_rooting_x_rotation gm4_gv_gen_data

# [Loop]
scoreboard players add $soil_rooting_current_root gm4_gv_gen_data 1
scoreboard players remove $soil_rooting_spreader_loop gm4_gv_gen_data 1
execute if score $soil_rooting_spreader_loop gm4_gv_gen_data matches 0 run kill @s[type=!player]
execute if score $soil_rooting_spreader_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:generation/soil_rooting/rooting_spreader
