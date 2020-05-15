# @s = armor_stand ..1 from written book

execute store result score @s gm4_pose_rotPx run data get entity @p[distance=..1] Rotation[1]
execute store result score @s gm4_pose_rotPy run data get entity @p[distance=..1] Rotation[0]
execute store result score @s gm4_pose_rotA run data get entity @s Rotation[0]

#rotation offset
scoreboard players operation @s gm4_pose_rotPy -= @s gm4_pose_rotA
