# @s = modified armor_stand
# at @s
# run from apply_pose

advancement grant @a[gamemode=!spectator,distance=..4] only gm4:poses_pack

playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
tag @s remove gm4_pose_changed

tag @s add gm4_bas_modified
