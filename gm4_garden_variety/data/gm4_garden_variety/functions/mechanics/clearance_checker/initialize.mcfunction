# initializes the clearance checker
# @s = @e[type=marker,tag=gm4_gv_sapling,tag=gm4_TREE_TYPE_sapling]
# at @s align xyz
# run from gm4_garden_variety_trees:generate/TREE_TYPE/generate


# [Checker/Generation] check for clearance
scoreboard players set $clearance_check gm4_gv_tree_gen 1
scoreboard players operation $clearance_check_loop gm4_gv_tree_gen = $trunk_layers gm4_gv_tree_gen
execute unless score $clearance_checker gm4_gv_nbt_data matches 0 at @s align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["gm4_gv_clearance_checker_marker"]}
execute unless score $clearance_checker gm4_gv_nbt_data matches 0 at @s run execute as @e[type=marker,tag=gm4_gv_clearance_checker_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/clearance_checker/check
