# @s = armor_stand ..1 from written book

summon minecraft:armor_stand ~ ~ ~ {Tags:["gm4_pose_temp"],Invisible:1b}
data modify entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightLeg set from entity @s Pose.RightLeg

data modify entity @s Pose.RightLeg[0] set from entity @s Pose.LeftLeg[0]
execute store result entity @s Pose.RightLeg[1] float -1 run data get entity @s Pose.LeftLeg[1]
execute store result entity @s Pose.RightLeg[2] float -1 run data get entity @s Pose.LeftLeg[2]
data modify entity @s Pose.LeftLeg[0] set from entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightLeg[0]
execute store result entity @s Pose.LeftLeg[1] float -1 run data get entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightLeg[1]
execute store result entity @s Pose.LeftLeg[2] float -1 run data get entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightLeg[2]

kill @e[tag=gm4_pose_temp,distance=..1]
