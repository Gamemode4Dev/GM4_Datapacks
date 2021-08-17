# @s = armor_stand to be modified
# at @s
# run from apply_book

data merge entity @s {NoGravity:0,NoBasePlate:0,ShowArms:1,Small:0,Invisible:0b}
data remove entity @s Pose
tag @s remove gm4_turn_clockwise
tag @s remove gm4_turn_anticlockwise

playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
