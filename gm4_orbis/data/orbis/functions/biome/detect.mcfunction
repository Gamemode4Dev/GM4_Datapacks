## BIOME IDS ##
# 0 - default
# 1 - ocean
# 2 - desert
# 3 - snow
# 4 - mesa

# set the biome type to default
scoreboard players set @s gm4_orbis_biome 0

# having at least 16x16 blocks of water at layers 61 and 62 makes it an ocean
# a different method than /clone filtered force is used here because I noticed
# that method caused significantly more lag for some reason
scoreboard players set orbis_water gm4_count 0
execute positioned ~ 62 ~ run function orbis:biome/get_water
execute positioned ~ 55 ~ run function orbis:biome/get_water
execute if score orbis_water gm4_count matches 384.. run scoreboard players set @s gm4_orbis_biome 1

# having at least 16x8 blocks of sandstone between layer 56 and 110 makes it a desert
execute store result score orbis_sand gm4_count run clone ~ 56 ~ ~15 110 ~15 ~ 56 ~ filtered sandstone force
execute if score orbis_sand gm4_count matches 128.. run scoreboard players set @s gm4_orbis_biome 2

# having at least 128 snow layer blocks makes it a snow biome
execute store result score orbis_snow gm4_count run clone ~ 60 ~ ~15 89 ~15 ~ 60 ~ filtered snow force
execute if score orbis_snow gm4_count matches 128.. run scoreboard players set @s gm4_orbis_biome 3

# having at least 64 terracotta or 64 red sand makes it a mesa
execute store result score orbis_terracotta gm4_count run clone ~ 62 ~ ~15 80 ~15 ~ 62 ~ filtered terracotta force
execute if score orbis_terracotta gm4_count matches 64.. run scoreboard players set @s gm4_orbis_biome 4
execute store result score orbis_red_sand gm4_count run clone ~ 62 ~ ~15 80 ~15 ~ 62 ~ filtered red_sand force
execute if score orbis_red_sand gm4_count matches 64.. run scoreboard players set @s gm4_orbis_biome 4
