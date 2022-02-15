# @s = @e[type=marker,tag=gm4_bas_player_offset]
# at @e[type=marker,tag=gm4_bas_joint]
# run from pose/track/update_markers

# rotate joint marker to face offset marker
tp @e[type=marker,tag=gm4_bas_joint,distance=..1,sort=nearest,limit=1] ~ ~ ~ facing entity @s

# store player and armor_stand rotation in scoreboard so rotation offset can be applied.
execute store result score $joint_rot_x gm4_bas_data run data get entity @e[type=marker,tag=gm4_bas_joint,sort=nearest,limit=1] Rotation[1] 100
execute store result score $joint_rot_y gm4_bas_data run data get entity @e[type=marker,tag=gm4_bas_joint,sort=nearest,limit=1] Rotation[0] 100
