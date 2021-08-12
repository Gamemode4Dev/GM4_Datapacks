# @s = armor_stand to be modified
# at @s
# run from pose/arms

# Initialize scoreboard and storage with pose data.
function gm4_poses_pack:pose/update_values
data modify storage gm4_better_armour_stands:temp Pose set value {RightArm:[0f,0f,0f]}
execute store result storage gm4_better_armour_stands:temp Pose.RightArm[0] float 0.001 run scoreboard players remove $player_rot_x gm4_poses_data 90000
execute store result storage gm4_better_armour_stands:temp Pose.RightArm[1] float 0.001 run scoreboard players get $player_rot_y gm4_poses_data

# Copy pose data from storage to entity.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose
