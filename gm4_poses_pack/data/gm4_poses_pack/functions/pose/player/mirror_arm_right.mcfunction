# @s = armor_stand to be modified
# at @s
# run from pose/arms

# Initialize storage with mirrored pose data.
data modify storage gm4_better_armour_stands:temp Pose set value {LeftArm:[0f,0f,0f]}
data modify storage gm4_better_armour_stands:temp Pose.LeftArm[0] set from entity @s Pose.RightArm[0]
execute store result storage gm4_better_armour_stands:temp Pose.LeftArm[1] float -1 run data get entity @s Pose.RightArm[1]
execute store result storage gm4_better_armour_stands:temp Pose.LeftArm[2] float -1 run data get entity @s Pose.RightArm[2]

# Copy pose data from storage to entity.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose
tag @s add gm4_pose_changed
