# @s = armor_stand ..1 from writable_book
data merge entity @s {Pose:{RightArm:[0f,0f,0f]}}
data modify entity @s Pose.RightArm[0] set from entity @s Pose.LeftArm[0]
execute store result entity @s Pose.RightArm[1] float -1 run data get entity @s Pose.LeftArm[1]
execute store result entity @s Pose.RightArm[2] float -1 run data get entity @s Pose.LeftArm[2]
tag @s add gm4_pose_changed
