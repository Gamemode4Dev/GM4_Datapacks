# @s = player modifying armor_stand
# at @s
# run from pose/track/update

scoreboard players add $joint_rot_x gm4_bas_data 750
scoreboard players operation $joint_rot_x gm4_bas_data /= #1500 gm4_bas_data
scoreboard players operation $joint_rot_x gm4_bas_data *= #1500 gm4_bas_data

scoreboard players add $joint_rot_y gm4_bas_data 750
scoreboard players operation $joint_rot_y gm4_bas_data /= #1500 gm4_bas_data
scoreboard players operation $joint_rot_y gm4_bas_data *= #1500 gm4_bas_data
