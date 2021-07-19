# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize

# debug
data modify storage gm4_garden_variety:debug/generation path append value "[SC] "
execute if score debug_generation gm4_gv_gen_data matches 1 run particle happy_villager ~ ~1 ~

# summon marker and begin conversion
scoreboard players set soil_conversion_spin_loop gm4_gv_gen_data 12
execute at @s positioned ~ ~-.5 ~ run summon marker ~ ~ ~ {Tags:["gm4_gv_soil_converter_marker"]}
execute at @s run execute as @e[type=marker,tag=gm4_gv_soil_converter_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:generation/soil_conversion/converter

