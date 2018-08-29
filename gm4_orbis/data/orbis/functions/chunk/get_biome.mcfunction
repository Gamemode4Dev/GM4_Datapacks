## BIOME IDS ##
# 0 - default
# 1 - ocean
# 2 - desert
# 3 - snow
# 4 - mesa

scoreboard players set @s orbis_biome 0

scoreboard players set orbis_water gm4_count 0
execute positioned ~ 62 ~ run function orbis:chunk/get_water
execute unless score orbis_water gm4_count matches 256.. positioned ~ 61 ~ run function orbis:chunk/get_water
execute if score orbis_water gm4_count matches 256.. run scoreboard players set @s orbis_biome 1

execute store result score orbis_sand gm4_count run clone ~ 60 ~ ~15 110 ~15 ~ 60 ~ filtered sandstone force
execute if score orbis_sand gm4_count matches 128.. run scoreboard players set @s orbis_biome 2

execute store result score orbis_snow gm4_count run clone ~ 60 ~ ~15 89 ~15 ~ 60 ~ filtered snow force
execute if score orbis_snow gm4_count matches 32.. run scoreboard players set @s orbis_biome 3
execute store result score orbis_ice gm4_count run clone ~ 60 ~ ~15 89 ~15 ~ 60 ~ filtered ice force
execute if score orbis_ice gm4_count matches 32.. run scoreboard players set @s orbis_biome 3

execute store result score orbis_terracotta gm4_count run clone ~ 62 ~ ~15 80 ~15 ~ 62 ~ filtered terracotta force
execute if score orbis_terracotta gm4_count matches 64.. run scoreboard players set @s orbis_biome 4
execute store result score orbis_red_sand gm4_count run clone ~ 62 ~ ~15 80 ~15 ~ 62 ~ filtered red_sand force
execute if score orbis_red_sand gm4_count matches 64.. run scoreboard players set @s orbis_biome 4
