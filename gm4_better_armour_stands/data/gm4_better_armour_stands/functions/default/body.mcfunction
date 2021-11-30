# @s = armor_stand to be modified
# at @s
# run from book/apply

data modify entity @s Pose.Body set from storage gm4_better_armour_stands:default Pose.Body
playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1

advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
