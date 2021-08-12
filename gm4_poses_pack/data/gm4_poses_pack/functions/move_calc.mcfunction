# @s = armor_stand to be modified
# at @s
# run from apply_pose

# Get position/rotation
execute store result score $player_rot_x gm4_poses_data run data get entity @p[tag=gm4_bas_active] Rotation[1] 1000
execute store result score $as_pos_y gm4_poses_data run data get entity @s Pos[1] 1000

# Calculate and apply new y position
scoreboard players operation $player_rot_x gm4_poses_data /= #max_rot gm4_poses_data
execute store result entity @s Pos[1] double 0.001 run scoreboard players operation $as_pos_y gm4_poses_data += $player_rot_x gm4_poses_data
