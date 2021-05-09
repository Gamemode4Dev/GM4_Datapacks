# @s = armor_stand ..1 from writable_book

# Initialize scoreboard and storage with pose data.
function gm4_poses_pack:pose/update_values
data modify storage gm4_better_armour_stands:temp Pose set value {RightArm:[0f,0f,0f]}
execute store result storage gm4_better_armour_stands:temp Pose.RightArm[0] float 1 run scoreboard players remove pose_x gm4_pose_rot 90
execute store result storage gm4_better_armour_stands:temp Pose.RightArm[1] float 1 run scoreboard players get pose_y gm4_pose_rot

# Copy pose data from storage to entity.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose
