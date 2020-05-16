# @s = armor_stand ..1 from written book

summon minecraft:armor_stand ~ ~ ~ {Tags:["gm4_pose_temp"],ShowArms:1b,Invisible:1b}
data modify entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightArm set from entity @s Pose.RightArm

data modify entity @s Pose.RightArm[0] set from entity @s Pose.LeftArm[0]
execute store result entity @s Pose.RightArm[1] float -1 run data get entity @s Pose.LeftArm[1]
execute store result entity @s Pose.RightArm[2] float -1 run data get entity @s Pose.LeftArm[2]
data modify entity @s Pose.LeftArm[0] set from entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightArm[0]
execute store result entity @s Pose.LeftArm[1] float -1 run data get entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightArm[1]
execute store result entity @s Pose.LeftArm[2] float -1 run data get entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightArm[2]

kill @e[tag=gm4_pose_temp,distance=..1]
