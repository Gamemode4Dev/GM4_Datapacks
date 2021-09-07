# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from #gm4_garden_variety:mechanics/tree_generation/initialize


# [Checker/Generation] check for clearance
scoreboard players set $clearance_check gm4_gv_gen_data 1
scoreboard players operation $clearance_check_loop gm4_gv_gen_data = $trunk_layers gm4_gv_gen_data
execute unless score $clearance_checker gm4_gv_nbt_data matches 0 at @s align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["gm4_gv_clearance_checker_marker"]}
execute unless score $clearance_checker gm4_gv_nbt_data matches 0 at @s run execute as @e[type=marker,tag=gm4_gv_clearance_checker_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/clearance_checker/check
