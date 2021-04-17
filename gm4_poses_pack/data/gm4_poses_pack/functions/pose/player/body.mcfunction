# @s = armor_stand ..1 from written book

function gm4_poses_pack:pose/update_values

data merge entity @s {Pose:{Body:[0.01f,0f,0f]}}
execute store result entity @s Pose.Body[0] float 1 run scoreboard players get @s gm4_pose_rotPx
execute store result entity @s Pose.Body[1] float 1 run scoreboard players get @s gm4_pose_rotPy
