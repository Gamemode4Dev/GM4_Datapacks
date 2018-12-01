#@s = rabbit attacked by player with transmutation stone
#Run from mobs/check_charge

execute store result score @s gm4_ee_hit run data get entity @s RabbitType

scoreboard players add @s gm4_ee_hit 1
execute if score @s gm4_ee_hit matches 6.. run scoreboard players set @s gm4_ee_hit 0

execute store result entity @s RabbitType byte 1 run scoreboard players get @s gm4_ee_hit

playsound minecraft:entity.evoker.prepare_attack player @a[distance=..6] ~ ~ ~ 0.3 1.5
