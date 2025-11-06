# decreases player gravity when actively ascending
# @s = player wearing wetsuit, jump input
# located at @s, in water
# run from enchant, gm4_scuba_gear:enchantment/wetsuit

item modify entity @s armor.legs gm4_scuba_gear:wetsuit_buoyancy/negative

scoreboard players set @s gm4_sg_buoyancy 1
