# @s = armor_stand to be modified
# at @s
# run from pose/legs

# Initialize storage with mirrored pose data.
data modify storage gm4_better_armour_stands:temp Pose set value {RightLeg:[0f,0f,0f]}
data modify storage gm4_better_armour_stands:temp Pose.RightLeg[0] set from entity @s Pose.LeftLeg[0]
execute store result storage gm4_better_armour_stands:temp Pose.RightLeg[1] float -1 run data get entity @s Pose.LeftLeg[1]
execute store result storage gm4_better_armour_stands:temp Pose.RightLeg[2] float -1 run data get entity @s Pose.LeftLeg[2]

# Copy pose data from storage to entity.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose
tag @s add gm4_pose_changed
