# @s = armor_stand ..1 from writable_book
execute store result score body gm4_pose_rot run data get entity @s Pose.Body[0]
execute store result entity @s Pose.Body[0] float 1 run scoreboard players add body gm4_pose_rot 180
