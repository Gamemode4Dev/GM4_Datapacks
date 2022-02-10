# @s = armor_stand to be modified
# at @s
# run from pose/track/arm_right

# initialize
data modify storage gm4_better_armour_stands:temp Pose merge value {LeftArm:[0f,0f,0f]}

# copy pose from other arm and mirror rotation
data modify storage gm4_better_armour_stands:temp Pose.LeftArm[0] set from storage gm4_better_armour_stands:temp Pose.RightArm[0]
execute store result storage gm4_better_armour_stands:temp Pose.LeftArm[1] float -0.01 run scoreboard players get $joint_rot_y gm4_bas_data
execute store result storage gm4_better_armour_stands:temp Pose.LeftArm[2] float -1 run data get storage gm4_better_armour_stands:temp Pose.RightArm[2]
