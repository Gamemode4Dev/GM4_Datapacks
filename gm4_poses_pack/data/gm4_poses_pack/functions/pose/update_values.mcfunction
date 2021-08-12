# @s = armor_stand to be modified
# at @s
# run from some functions in pose/player/

# Store player and armor stand rotation in scoreboard so rotation offset can be applied.
execute store result score $player_rot_x gm4_poses_data run data get entity @p[tag=gm4_bas_active] Rotation[1] 1000
execute store result score $player_rot_y gm4_poses_data run data get entity @p[tag=gm4_bas_active] Rotation[0] 1000
execute store result score $as_rot_y gm4_poses_data run data get entity @s Rotation[0] 1000

# Apply rotation offset so that poses are relative to armor stand rotation.
scoreboard players operation $player_rot_y gm4_poses_data -= $as_rot_y gm4_poses_data 
tag @s add gm4_pose_changed
