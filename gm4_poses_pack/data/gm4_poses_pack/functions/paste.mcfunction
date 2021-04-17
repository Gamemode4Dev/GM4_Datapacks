# @s = armor_stand item ..1 from armor_stand
#paste pose to armor_stand
data modify entity @e[distance=..1,type=minecraft:armor_stand,limit=1,sort=nearest] Pose set from entity @s Item.tag.EntityTag.Pose
data modify entity @e[distance=..1,type=minecraft:armor_stand,limit=1,sort=nearest] ShowArms set from entity @s Item.tag.EntityTag.ShowArms
data modify entity @e[distance=..1,type=minecraft:armor_stand,limit=1,sort=nearest] NoBasePlate set from entity @s Item.tag.EntityTag.NoBasePlate
data modify entity @e[distance=..1,type=minecraft:armor_stand,limit=1,sort=nearest] Small set from entity @s Item.tag.EntityTag.Small

#place confirm
playsound minecraft:block.stone.place player @a[distance=..5] ~ ~ ~ 1 .2
tag @s add gm4_pose_copied
