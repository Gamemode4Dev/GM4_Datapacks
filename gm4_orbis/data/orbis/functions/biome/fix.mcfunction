# If the chunk is surrounded by 3 other biome types, set its biome type to that instead
# this fixes most failurs except when the chunk has 2 biome types both with 2 chunks adjacent
# In that case, set the biome type to default. Not doing any modifications is better than
# chosing the wrong one

execute store result score temp gm4_count if entity @e[type=area_effect_cloud,tag=gm4_chunk,tag=gm4_adjacent,scores={gm4_orbis_biome=0}]
execute if score temp gm4_count matches 3.. run scoreboard players set @s gm4_orbis_biome 0

execute store result score temp gm4_count if entity @e[type=area_effect_cloud,tag=gm4_chunk,tag=gm4_adjacent,scores={gm4_orbis_biome=1}]
execute if score temp gm4_count matches 0 run scoreboard players set @s[scores={gm4_orbis_biome=1}] gm4_orbis_biome 0
execute if score temp gm4_count matches 3.. run scoreboard players set @s gm4_orbis_biome 1

execute store result score temp gm4_count if entity @e[type=area_effect_cloud,tag=gm4_chunk,tag=gm4_adjacent,scores={gm4_orbis_biome=2}]
execute if score temp gm4_count matches 0 run scoreboard players set @s[scores={gm4_orbis_biome=2}] gm4_orbis_biome 0
execute if score temp gm4_count matches 3.. run scoreboard players set @s gm4_orbis_biome 2

execute store result score temp gm4_count if entity @e[type=area_effect_cloud,tag=gm4_chunk,tag=gm4_adjacent,scores={gm4_orbis_biome=3}]
execute if score temp gm4_count matches 0 run scoreboard players set @s[scores={gm4_orbis_biome=3}] gm4_orbis_biome 0
execute if score temp gm4_count matches 3.. run scoreboard players set @s gm4_orbis_biome 3

execute store result score temp gm4_count if entity @e[type=area_effect_cloud,tag=gm4_chunk,tag=gm4_adjacent,scores={gm4_orbis_biome=4}]
execute if score temp gm4_count matches 0 run scoreboard players set @s[scores={gm4_orbis_biome=4}] gm4_orbis_biome 0
execute if score temp gm4_count matches 3.. run scoreboard players set @s gm4_orbis_biome 4
