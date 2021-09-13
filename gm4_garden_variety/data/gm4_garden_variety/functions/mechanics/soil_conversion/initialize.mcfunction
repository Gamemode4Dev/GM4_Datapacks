# initilizes the soil converter
# @s = @e[type=marker,tag=gm4_tree_trunk_marker]
# at @s align xyz positioned ~.5 ~ ~.5
# run from gm4_garden_variety:mechanics/tree_generation/pre_generation


# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "[SC] "

# summon marker and begin conversion
execute if score $soil_conversion_radius gm4_gv_tree_gen matches 1..2 run scoreboard players set $soil_converter_spreader_loop gm4_gv_tree_gen 8
execute if score $soil_conversion_radius gm4_gv_tree_gen matches 3..4 run scoreboard players set $soil_converter_spreader_loop gm4_gv_tree_gen 12
execute if score $soil_conversion_radius gm4_gv_tree_gen matches 5.. run scoreboard players set $soil_converter_spreader_loop gm4_gv_tree_gen 16
execute at @s align xyz positioned ~.5 ~-.5 ~.5 run summon marker ~ ~ ~ {Tags:["gm4_gv_soil_converter_spreader_marker"]}
execute at @s run execute as @e[type=marker,tag=gm4_gv_soil_converter_spreader_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/soil_conversion/converter_spreader
