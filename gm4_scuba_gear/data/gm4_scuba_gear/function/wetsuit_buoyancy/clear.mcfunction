# removes wetsuit attributes when out of water
# @s = player wearing wetsuit
# located at @s
# run from enchant, gm4_scuba_gear:enchantment/wetsuit

item modify entity @s armor.legs gm4_scuba_gear:wetsuit_buoyancy/clear

scoreboard players reset @s gm4_sg_buoyancy
