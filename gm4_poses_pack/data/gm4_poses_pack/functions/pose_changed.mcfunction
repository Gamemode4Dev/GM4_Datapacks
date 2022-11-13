# @s = modified armor_stand
# at @s
# run from apply_pose

advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:poses_pack

playsound minecraft:entity.armor_stand.fall block @a[distance=..6] ~ ~ ~ 0.5 1

scoreboard players set $valid_code gm4_bas_data 1
