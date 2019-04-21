# get the biome type
execute positioned ~8 1000 ~8 run function orbis:chunk/scan

# run general and biome specific function tags
# other modules can have functions in these tags as expansion to orbis
function #orbis:chunk/generate
execute if score @s gm4_orbis_biome matches 0 run function #orbis:biome/default
execute if score @s gm4_orbis_biome matches 1 run function #orbis:biome/ocean
execute if score @s gm4_orbis_biome matches 2 run function #orbis:biome/desert
execute if score @s gm4_orbis_biome matches 3 run function #orbis:biome/snow
execute if score @s gm4_orbis_biome matches 4 run function #orbis:biome/mesa

# mark the chunk as generated
scoreboard players add chunk_count gm4_orbis_config 1
fill ~ 0 ~ ~15 0 ~15 barrier replace bedrock
tag @s add gm4_generated

# spred outwards
execute positioned ~16 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
execute positioned ~-16 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
execute positioned ~ ~ ~16 unless entity @e[type=area_effect_cloud,tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
execute positioned ~ ~ ~-16 unless entity @e[type=area_effect_cloud,tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
