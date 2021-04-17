# @s = armor_stand ..1 from written book

function gm4_poses_pack:pose/update_values

data merge entity @s {Pose:{Body:[0.01f,0f,0f]}}
data modify entity @s Pose.Body[0] set from entity @p[distance=..1,gamemode=!spectator] Rotation[1]
execute store result entity @s Pose.Body[1] float 1 run scoreboard players get @s gm4_pose_rotPy
