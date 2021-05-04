# get the biome type
scoreboard players reset * gm4_orbis_biome
execute positioned ~8 0 ~8 run function gm4_orbis:chunk/scan
# scan other parts of the chunk if a river has been detected
execute if score border gm4_orbis_biome matches 1 run function gm4_orbis:chunk/border

# other modules can have functions in this tag as expansion to orbis
function #gm4_orbis:chunk/generate

# mark the chunk as generated
scoreboard players add chunk_count gm4_orbis_config 1
fill ~ 0 ~ ~15 0 ~15 barrier replace bedrock
execute if block ~ 0 ~ barrier run scoreboard players add loaded_chunks gm4_orbis_config 1
tag @s add gm4_generated

# spred outwards
execute positioned ~16 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
execute positioned ~-16 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
execute positioned ~ ~ ~16 unless entity @e[type=area_effect_cloud,tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
execute positioned ~ ~ ~-16 unless entity @e[type=area_effect_cloud,tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
