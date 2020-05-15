# @s = armor_stand ..1 from written book

summon minecraft:armor_stand ~ ~ ~ {Tags:["gm4_pose_temp"],Invisible:1b}
data modify entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightLeg set from entity @s Pose.RightLeg

data modify entity @s Pose.RightLeg set from entity @s Pose.LeftLeg
data modify entity @s Pose.LeftLeg set from entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightLeg

kill @e[tag=gm4_pose_temp,distance=..1]
