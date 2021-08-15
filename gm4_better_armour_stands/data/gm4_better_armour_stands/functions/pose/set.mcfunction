# @s = player modifying armor_stand
# at @s
# run from advancement confirm_pose

advancement revoke @s only gm4_better_armour_stands:confirm_pose

tp @e[type=villager,tag=gm4_bas_detect,distance=..2,sort=nearest,limit=1] ~ -1000 ~

tag @s remove gm4_bas_active
tag @s remove gm4_bas_track
tag @s remove gm4_bas_move

kill @e[type=marker,tag=gm4_bas_tracker,sort=nearest,limit=1]
execute at @e[type=armor_stand,tag=gm4_bas_track,sort=nearest,limit=1] run kill @e[type=marker,tag=gm4_bas_joint,sort=nearest,limit=1]
execute as @e[type=armor_stand,tag=gm4_bas_track,sort=nearest,limit=1] run tag @s remove gm4_bas_mirror
execute as @e[type=armor_stand,tag=gm4_bas_track,sort=nearest,limit=1] run tag @s remove gm4_bas_track

execute as @e[type=armor_stand,tag=gm4_bas_move,sort=nearest,limit=1] run tag @s remove gm4_bas_move
