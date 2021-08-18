# @s = armor_stand to be modified
# at @s
# run from pose/set

scoreboard players reset @s gm4_bas_id
tag @s remove gm4_bas_mirror
tag @s remove gm4_bas_invert
tag @s remove gm4_bas_alt
tag @s remove gm4_bas_track

execute at @s run playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
