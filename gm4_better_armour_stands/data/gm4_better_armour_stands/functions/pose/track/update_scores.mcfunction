# @s = @e[type=marker,tag=gm4_bas_joint]
# at @s
# run from pose/track/update

# Store player and armor stand rotation in scoreboard so rotation offset can be applied.
execute store result score $joint_rot_x gm4_bas_data run data get entity @e[type=marker,tag=gm4_bas_joint,sort=nearest,limit=1] Rotation[1] 100
execute store result score $joint_rot_y gm4_bas_data run data get entity @e[type=marker,tag=gm4_bas_joint,sort=nearest,limit=1] Rotation[0] 100
execute store result score $as_rot_y gm4_bas_data run data get entity @s Rotation[0] 100
scoreboard players operation $joint_rot_y gm4_bas_data -= $as_rot_y gm4_bas_data 
