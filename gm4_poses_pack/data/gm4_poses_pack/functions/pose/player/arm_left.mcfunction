# @s = armor_stand ..1 from writable_book
function gm4_poses_pack:pose/update_values
data merge entity @s {Pose:{LeftArm:[0f,0f,0f]}}
execute store result entity @s Pose.LeftArm[0] float 1 run scoreboard players remove pose_x gm4_pose_rot 90
execute store result entity @s Pose.LeftArm[1] float 1 run scoreboard players get pose_y gm4_pose_rot
