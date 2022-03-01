# @s = armor_stand to be modified
# at @s
# run from toggle/arms_detect_remove

data modify entity @s ShowArms set value 1

playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1

advancement grant @p[tag=gm4_bas_active] only gm4:better_armour_stands
