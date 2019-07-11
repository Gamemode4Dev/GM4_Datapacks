#@s = llama attacked by player with transmutation stone
#Run from mobs/check_charge

execute store result score @s gm4_ee_hit run data get entity @s Variant

scoreboard players add @s gm4_ee_hit 1
execute if score @s gm4_ee_hit matches 4.. run scoreboard players set @s gm4_ee_hit 0

execute store result entity @s Variant byte 1 run scoreboard players get @s gm4_ee_hit

playsound minecraft:entity.evoker.prepare_attack player @a[distance=..6] ~ ~ ~ 0.3 1.5
