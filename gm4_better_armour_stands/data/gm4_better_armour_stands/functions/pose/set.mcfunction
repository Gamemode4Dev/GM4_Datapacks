# @s = player modifying armor_stand
# at @s
# run from advancement confirm_pose and main

advancement revoke @s only gm4_better_armour_stands:confirm_pose

advancement grant @s only gm4:better_armour_stands

execute as @e[type=armor_stand,tag=gm4_bas_track] if score @s gm4_bas_id = @p[tag=gm4_bas_track] gm4_bas_id at @s run function gm4_better_armour_stands:pose/clear_tracking
execute as @e[type=marker,tag=gm4_bas_marker] if score @s gm4_bas_id = @p[tag=gm4_bas_track] gm4_bas_id at @s run kill @s
execute as @e[type=villager,tag=gm4_bas_detect] if score @s gm4_bas_id = @p[tag=gm4_bas_track] gm4_bas_id at @s run tp @s ~ -1000 ~

tag @s remove gm4_bas_track
