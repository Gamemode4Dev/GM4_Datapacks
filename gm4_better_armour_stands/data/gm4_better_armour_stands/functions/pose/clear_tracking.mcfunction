# @s = armor_stand to be modified
# at @s
# run from pose/set

scoreboard players reset @s gm4_bas_id
scoreboard players reset @s gm4_bas_mode

tag @s remove gm4_bas_track
tag @s remove gm4_bas_mirror
tag @s remove gm4_bas_alt

data remove entity @s Glowing

execute at @s run playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
