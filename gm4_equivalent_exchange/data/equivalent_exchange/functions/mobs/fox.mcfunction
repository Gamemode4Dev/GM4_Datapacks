#@s = cat attacked by player with transmutation stone
#Run from mobs/check_charge

execute if data entity @s {Type:"red"} run data merge entity @s {Type:"snow",Tags:[gm4_ee_converted]}
execute if data entity @s[tag=!gm4_ee_converted] {Type:"snow"} run data merge entity @s {Type:"red"}

playsound minecraft:entity.evoker.prepare_attack player @a[distance=..6] ~ ~ ~ 0.3 1.5
