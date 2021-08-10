# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize

# check block
execute if score $soil_conversion_max gm4_gv_gen_data matches 1.. if score $soil_conversion_radius gm4_gv_gen_data matches 1.. at @s positioned ^ ^ ^1 run function gm4_garden_variety:generation/soil_conversion/check_block
execute if score $soil_conversion_max gm4_gv_gen_data matches 1.. if score $soil_conversion_radius gm4_gv_gen_data matches 2.. at @s positioned ^ ^ ^2 run function gm4_garden_variety:generation/soil_conversion/check_block
execute if score $soil_conversion_max gm4_gv_gen_data matches 1.. if score $soil_conversion_radius gm4_gv_gen_data matches 3.. at @s positioned ^ ^ ^3 run function gm4_garden_variety:generation/soil_conversion/check_block
execute if score $soil_conversion_max gm4_gv_gen_data matches 1.. if score $soil_conversion_radius gm4_gv_gen_data matches 4.. at @s positioned ^ ^ ^4 run function gm4_garden_variety:generation/soil_conversion/check_block
execute if score $soil_conversion_max gm4_gv_gen_data matches 1.. if score $soil_conversion_radius gm4_gv_gen_data matches 5.. at @s positioned ^ ^ ^5 run function gm4_garden_variety:generation/soil_conversion/check_block

# rotate
execute at @s run tp @s ~ ~ ~ ~30 ~

# loop function until spin_loop hits 0
scoreboard players remove soil_conversion_spin_loop gm4_gv_gen_data 1
execute if score soil_conversion_spin_loop gm4_gv_gen_data matches 0 run kill @s[type=!player]
execute if score soil_conversion_spin_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:generation/soil_conversion/converter


