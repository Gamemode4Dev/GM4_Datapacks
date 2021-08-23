# @s = armor_stand to be modified
# at @s
# run from place

particle minecraft:barrier ~ ~1 ~ 0 0 0 0 1
playsound minecraft:entity.villager.no block @p[tag=gm4_bas_active] ~ ~ ~ .5 2

title @p[tag=gm4_bas_active] actionbar {"text":"Invalid code","color":"red"}
