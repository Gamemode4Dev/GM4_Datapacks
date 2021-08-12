# @s = armor_stand to be modified
# at @s
# run from apply_book

data merge entity @s {NoGravity:0,NoBasePlate:0,ShowArms:1,Small:0,Invisible:0b,Pose:{Head:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Body:[0f,0f,0f],LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]}}
tag @s remove gm4_turn_clockwise
tag @s remove gm4_turn_anticlockwise

playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
