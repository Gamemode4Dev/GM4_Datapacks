# @s = armor_stand ..1 from written book

function gm4_poses_pack:pose/update_values

data modify entity @s Pose.Head[2] set value 0f
data modify entity @s Pose.Head[0] set from entity @p[distance=..1] Rotation[1]
execute store result entity @s Pose.Head[1] float 1 run scoreboard players get @s gm4_pose_rotPy
