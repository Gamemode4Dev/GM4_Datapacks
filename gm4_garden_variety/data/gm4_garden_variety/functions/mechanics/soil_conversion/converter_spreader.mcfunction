# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize

# [Generation] summon marker and begin conversion
scoreboard players set $soil_converter_distance gm4_gv_tree_gen 1
scoreboard players operation $soil_converter_loop gm4_gv_tree_gen = $soil_conversion_radius gm4_gv_tree_gen
execute at @s positioned ~ ~-.5 ~ run summon marker ~ ~ ~ {Tags:["gm4_gv_soil_converter_marker"]}
execute at @s run tp @e[type=marker,tag=gm4_gv_soil_converter_marker,limit=1,sort=nearest] @s
execute at @s run execute as @e[type=marker,tag=gm4_gv_soil_converter_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/soil_conversion/converter

# [Generation] rotate
execute if score $soil_conversion_radius gm4_gv_tree_gen matches 1..2 at @s run tp @s ~ ~ ~ ~45 ~
execute if score $soil_conversion_radius gm4_gv_tree_gen matches 3..4 at @s run tp @s ~ ~ ~ ~30 ~
execute if score $soil_conversion_radius gm4_gv_tree_gen matches 5.. at @s run tp @s ~ ~ ~ ~22.5 ~

# [Loop]
scoreboard players remove $soil_converter_spreader_loop gm4_gv_tree_gen 1
execute if score $soil_converter_spreader_loop gm4_gv_tree_gen matches 0 run kill @s[type=!player]
execute if score $soil_converter_spreader_loop gm4_gv_tree_gen matches 1.. run function gm4_garden_variety:mechanics/soil_conversion/converter_spreader

