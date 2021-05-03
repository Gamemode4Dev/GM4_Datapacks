# @s = armor_stand ..1 from writable_book
data merge entity @s {Pose:{LeftLeg:[0f,0f,0f]}}
data modify entity @s Pose.LeftLeg[0] set from entity @s Pose.RightLeg[0]
execute store result entity @s Pose.LeftLeg[1] float -1 run data get entity @s Pose.RightLeg[1]
execute store result entity @s Pose.LeftLeg[2] float -1 run data get entity @s Pose.RightLeg[2]
tag @s add gm4_pose_changed
