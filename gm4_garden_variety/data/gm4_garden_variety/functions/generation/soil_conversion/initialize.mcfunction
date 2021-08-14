# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize

# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "[SC] "

# [Generation] summon marker and begin conversion
execute if score $soil_conversion_radius gm4_gv_gen_data matches 1..2 run scoreboard players set $soil_converter_spreader_loop gm4_gv_gen_data 8
execute if score $soil_conversion_radius gm4_gv_gen_data matches 3..4 run scoreboard players set $soil_converter_spreader_loop gm4_gv_gen_data 12
execute if score $soil_conversion_radius gm4_gv_gen_data matches 5.. run scoreboard players set $soil_converter_spreader_loop gm4_gv_gen_data 16
execute at @s align xyz positioned ~.5 ~-.5 ~.5 run summon marker ~ ~ ~ {Tags:["gm4_gv_soil_converter_spreader_marker"]}
execute at @s run execute as @e[type=marker,tag=gm4_gv_soil_converter_spreader_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:generation/soil_conversion/converter_spreader
