# @s = armor_stand item ..1 from armor_stand
#copy tags to item
data modify entity @s Item.tag.EntityTag.Pose set from entity @e[distance=..1,type=minecraft:armor_stand,limit=1] Pose
data modify entity @s Item.tag.EntityTag.ShowArms set from entity @e[distance=..1,type=minecraft:armor_stand,limit=1] ShowArms
data modify entity @s Item.tag.EntityTag.NoBasePlate set from entity @e[distance=..1,type=minecraft:armor_stand,limit=1] NoBasePlate
data modify entity @s Item.tag.EntityTag.Small set from entity @e[distance=..1,type=minecraft:armor_stand,limit=1] Small

#give enchant glow
data merge entity @s {Item:{tag:{HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:0}]}}}

#copy confirm
particle item armor_stand ~ ~ ~ .2 1 .2 0 20
playsound minecraft:block.wood.break player @a[distance=..5] ~ ~ ~ 1 .2
tag @s add gm4_pose_copied