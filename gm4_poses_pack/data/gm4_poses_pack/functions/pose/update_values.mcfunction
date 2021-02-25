# @s = armor_stand ..1 from writable_book

# Store player and armor stand rotation in scoreboard so rotation offset can be applied.
execute store result score pose_x gm4_pose_rot run data get entity @p[distance=..1,gamemode=!spectator] Rotation[1]
execute store result score pose_y gm4_pose_rot run data get entity @p[distance=..1,gamemode=!spectator] Rotation[0]
execute store result score entity_y gm4_pose_rot run data get entity @s Rotation[0]

# Apply rotation offset so that poses are relative to armor stand rotation.
scoreboard players operation pose_y gm4_pose_rot -= entity_y gm4_pose_rot 
tag @s add gm4_pose_changed
