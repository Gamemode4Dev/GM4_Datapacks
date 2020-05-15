# @s = armor_stand ..1 from written book

function gm4_poses:pose/update_values
tag @s add gm4_pose_changed

data modify entity @s Pose.Body[2] set value 0f
data modify entity @s Pose.Body[0] set from entity @p[distance=..1] Rotation[1]
execute store result entity @s Pose.Body[1] float 1 run scoreboard players get @s gm4_pose_rotPy
