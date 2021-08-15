# @s = player modifying armor_stand
# at @s
# run from functions in pose/track/

scoreboard players add $joint_rot_x gm4_bas_data 900
scoreboard players operation $joint_rot_x gm4_bas_data /= #rounding gm4_bas_data
scoreboard players operation $joint_rot_x gm4_bas_data *= #rounding gm4_bas_data

scoreboard players add $joint_rot_y gm4_bas_data 900
scoreboard players operation $joint_rot_y gm4_bas_data /= #rounding gm4_bas_data
scoreboard players operation $joint_rot_y gm4_bas_data *= #rounding gm4_bas_data
