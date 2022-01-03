# @s = armor_stand to be modified
# at @s
# run from book/apply

data modify entity @s Pose set from storage gm4_better_armour_stands:default Pose
data merge entity @s {NoGravity:0,NoBasePlate:0,ShowArms:1,Small:0,Invisible:0b}
effect clear @s glowing

scoreboard players reset @s gm4_particle
scoreboard players reset @s gm4_bas_turn

tag @s add gm4_bas_valid_code
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands

playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
