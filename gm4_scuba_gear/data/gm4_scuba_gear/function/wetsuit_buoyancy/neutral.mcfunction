# negates player gravity to maintain vertical position
# @s = player wearing wetsuit, not sneak or jump input 
# located at @s, in water
# run from enchant, gm4_scuba_gear:enchantment/wetsuit

item modify entity @s armor.legs gm4_scuba_gear:wetsuit_buoyancy/neutral

scoreboard players set @s gm4_sg_buoyancy 0
