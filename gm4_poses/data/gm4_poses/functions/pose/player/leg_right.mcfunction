# @s = armor_stand ..1 from written book

function gm4_poses:pose/update_values
data merge entity @s {Pose:{RightLeg:[0f,0f,0f]}}
tag @s add gm4_pose_changed

data modify entity @s Pose.RightLeg[2] set value 0f
execute store result entity @s Pose.RightLeg[0] float 1 run scoreboard players remove @s gm4_pose_rotPx 90
execute store result entity @s Pose.RightLeg[1] float 1 run scoreboard players get @s gm4_pose_rotPy
