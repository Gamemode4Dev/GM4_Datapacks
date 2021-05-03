# @s = armor_stand ..1 from writable_book
data merge entity @s {Pose:{LeftArm:[0f,0f,0f]}}
data modify entity @s Pose.LeftArm[0] set from entity @s Pose.RightArm[0]
execute store result entity @s Pose.LeftArm[1] float -1 run data get entity @s Pose.RightArm[1]
execute store result entity @s Pose.LeftArm[2] float -1 run data get entity @s Pose.RightArm[2]
tag @s add gm4_pose_changed
