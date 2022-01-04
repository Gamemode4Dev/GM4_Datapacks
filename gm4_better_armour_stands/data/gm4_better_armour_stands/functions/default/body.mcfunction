# @s = armor_stand to be modified
# at @s
# run from apply_book

data modify entity @s Pose.Body set from storage gm4_better_armour_stands:default Pose.Body
playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1

advancement grant @p[tag=gm4_bas_active] only gm4:better_armour_stands
