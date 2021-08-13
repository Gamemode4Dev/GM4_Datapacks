# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize

# [Generation] check block
execute if score $soil_conversion_max gm4_gv_gen_data matches 1.. at @s positioned ^ ^ ^1 run function gm4_garden_variety:generation/soil_conversion/check_block

# [Generation] move forward
scoreboard players add $soil_converter_distance gm4_gv_gen_data 1
execute at @s run tp @s ^ ^ ^1

# [Loop]
scoreboard players remove $soil_converter_loop gm4_gv_gen_data 1
execute if score $soil_converter_loop gm4_gv_gen_data matches 0 run kill @s[type=!player]
execute if score $soil_converter_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:generation/soil_conversion/converter
