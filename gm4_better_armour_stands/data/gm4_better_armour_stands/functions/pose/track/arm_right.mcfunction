# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track] positioned ~ ~1.6 ~
# run from pose/track/update

# convert scores to rotation in storage
data modify storage gm4_better_armour_stands:temp Pose set value {RightArm:[0f,0f,0f]}
execute store result storage gm4_better_armour_stands:temp Pose.RightArm[0] float 0.01 run scoreboard players remove $joint_rot_x gm4_bas_data 9000
execute store result storage gm4_better_armour_stands:temp Pose.RightArm[1] float 0.01 run scoreboard players get $joint_rot_y gm4_bas_data

# mirror to other arm
execute if entity @s[tag=gm4_bas_mirror] run function gm4_better_armour_stands:pose/mirror/arm_right
