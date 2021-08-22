# @s = armor_stand to be modified
# at @s
# run from apply_book

data merge entity @s {NoGravity:0,NoBasePlate:0,ShowArms:1,Small:0,Invisible:0b}
data remove entity @s Pose

scoreboard players reset @s gm4_bas_turn
tag @s remove gm4_bas_turn

tag @s add gm4_bas_modified
advancement grant @p[tag=gm4_bas_active] only gm4:better_armour_stands

playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
