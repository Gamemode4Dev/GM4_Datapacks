# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# reset pose and other features
data modify entity @s Pose set from storage gm4_better_armour_stands:default Pose
data merge entity @s {ShowArms:1b,Small:0b,NoBasePlate:0b,NoGravity:0b,Invisible:0b}
scoreboard players reset @s gm4_bas_turn

effect clear @s glowing
playsound minecraft:entity.armor_stand.hit block @a[distance=..6] ~ ~ ~ 0.5 1
