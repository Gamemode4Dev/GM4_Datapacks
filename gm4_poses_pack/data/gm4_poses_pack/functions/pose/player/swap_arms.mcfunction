# @s = armor_stand ..1 from written book

summon minecraft:armor_stand ~ ~ ~ {Tags:["gm4_pose_temp"],ShowArms:1b,Invisible:1b}
data modify entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightArm set from entity @s Pose.RightArm

data modify entity @s Pose.RightArm set from entity @s Pose.LeftArm
data modify entity @s Pose.LeftArm set from entity @e[tag=gm4_pose_temp,distance=..1,limit=1] Pose.RightArm

kill @e[tag=gm4_pose_temp,distance=..1]

playsound minecraft:block.wooden_button.click_on player @a[distance=..5]
tag @s add gm4_pose_changed
