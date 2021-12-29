# @s = armor_stand to be modified
# at @s
# run from pose/set

scoreboard players reset @s gm4_bas_id
scoreboard players reset @s gm4_bas_mode
scoreboard players reset @s gm4_bas_move
scoreboard players reset @s gm4_bas_move_y

tag @s remove gm4_bas_track
tag @s remove gm4_bas_mirror
tag @s remove gm4_bas_alt

data remove entity @s DisabledSlots
data remove entity @s Glowing

playsound minecraft:entity.armor_stand.fall block @a[distance=..6] ~ ~ ~ 0.5 1
