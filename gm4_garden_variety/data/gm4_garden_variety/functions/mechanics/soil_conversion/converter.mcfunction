# converts the soil
# @s = @e[type=marker,tag=gm4_gv_soil_converter_marker]
# at @s
# run from gm4_garden_variety:mechanics/soil_conversion/converter_spreader


# check block
execute if score $soil_conversion_max gm4_gv_tree_gen matches 1.. at @s positioned ^ ^ ^1 run function gm4_garden_variety:mechanics/soil_conversion/check_block

# move forward
scoreboard players add $soil_converter_distance gm4_gv_tree_gen 1
execute at @s run tp @s ^ ^ ^1

# [Loop]
scoreboard players remove $soil_converter_loop gm4_gv_tree_gen 1
execute if score $soil_converter_loop gm4_gv_tree_gen matches 0 run kill @s[type=!player]
execute if score $soil_converter_loop gm4_gv_tree_gen matches 1.. run function gm4_garden_variety:mechanics/soil_conversion/converter
