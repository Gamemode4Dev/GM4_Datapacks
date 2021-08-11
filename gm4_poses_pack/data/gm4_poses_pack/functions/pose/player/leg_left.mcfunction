# @s = armor_stand to be modified
# at @s
# run from pose/legs

# Initialize scoreboard and storage with pose data.
function gm4_poses_pack:pose/update_values
data modify storage gm4_better_armour_stands:temp Pose set value {LeftLeg:[0f,0f,0f]}
execute store result storage gm4_better_armour_stands:temp Pose.LeftLeg[0] float 1 run scoreboard players remove pose_x gm4_pose_rot 90
execute store result storage gm4_better_armour_stands:temp Pose.LeftLeg[1] float 1 run scoreboard players get pose_y gm4_pose_rot

# Copy pose data from storage to entity.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose
