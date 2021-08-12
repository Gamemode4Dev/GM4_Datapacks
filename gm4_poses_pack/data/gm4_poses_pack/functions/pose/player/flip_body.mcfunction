# @s = armor_stand to be modified
# at @s
# run from pose/body

execute store result score body gm4_poses_data run data get entity @s Pose.Body[0]
execute store result entity @s Pose.Body[0] float 1 run scoreboard players add body gm4_poses_data 180
