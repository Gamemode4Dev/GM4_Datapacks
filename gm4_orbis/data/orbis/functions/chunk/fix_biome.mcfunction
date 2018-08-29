
execute store result score temp gm4_count if entity @e[tag=orbis_adjacent,scores={orbis_biome=0}]
execute if score temp gm4_count matches 3.. run scoreboard players set @s orbis_biome 0

execute store result score temp gm4_count if entity @e[tag=orbis_adjacent,scores={orbis_biome=1}]
execute if score temp gm4_count matches 0 run scoreboard players set @s[scores={orbis_biome=1}] orbis_biome 0
execute if score temp gm4_count matches 3.. run scoreboard players set @s orbis_biome 1

execute store result score temp gm4_count if entity @e[tag=orbis_adjacent,scores={orbis_biome=2}]
execute if score temp gm4_count matches 0 run scoreboard players set @s[scores={orbis_biome=2}] orbis_biome 0
execute if score temp gm4_count matches 3.. run scoreboard players set @s orbis_biome 2

execute store result score temp gm4_count if entity @e[tag=orbis_adjacent,scores={orbis_biome=3}]
execute if score temp gm4_count matches 0 run scoreboard players set @s[scores={orbis_biome=3}] orbis_biome 0
execute if score temp gm4_count matches 3.. run scoreboard players set @s orbis_biome 3

execute store result score temp gm4_count if entity @e[tag=orbis_adjacent,scores={orbis_biome=4}]
execute if score temp gm4_count matches 0 run scoreboard players set @s[scores={orbis_biome=4}] orbis_biome 0
execute if score temp gm4_count matches 3.. run scoreboard players set @s orbis_biome 4
