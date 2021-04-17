# @s = armor_stand ..1 from written book

execute store result score @s gm4_pose_rotB run data get entity @s Pose.Body[0]
execute store result entity @s Pose.Body[0] float 1 run scoreboard players add @s gm4_pose_rotB 180
