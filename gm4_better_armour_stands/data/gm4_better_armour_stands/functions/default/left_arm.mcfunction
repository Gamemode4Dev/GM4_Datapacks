# @s = armor_stand to be modified
# at @s
# run from book/apply

data modify entity @s Pose.LeftArm set from storage gm4_better_armour_stands:default Pose.LeftArm
playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1

advancement grant @p[tag=gm4_bas_active] only gm4:better_armour_stands
