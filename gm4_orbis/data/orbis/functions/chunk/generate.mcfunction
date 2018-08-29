# if the chunk hasn't been scanned yet, scan it
execute if entity @s[tag=!orbis_scanned] run function orbis:gen/scan
# save the determined biome type for later
scoreboard players operation orbis_old_biome orbis_biome = @s orbis_biome

# make sure there are 4 scanned chunks adjacent
execute positioned ~16 ~ ~ unless entity @e[tag=orbis_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[orbis_chunk],Duration:2000000000}
execute positioned ~-16 ~ ~ unless entity @e[tag=orbis_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[orbis_chunk],Duration:2000000000}
execute positioned ~ ~ ~16 unless entity @e[tag=orbis_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[orbis_chunk],Duration:2000000000}
execute positioned ~ ~ ~-16 unless entity @e[tag=orbis_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[orbis_chunk],Duration:2000000000}

tag @e[tag=orbis_chunk,distance=1..17] add orbis_adjacent
execute as @e[tag=orbis_adjacent,tag=!orbis_scanned] at @s run function orbis:chunk/scan

# do various things to improve biome detection
function orbis:chunk/fix_biome

# run general and biome specific function tags
# other modules can have functions in these tags as expansion to orbis
function #orbis:gen/chunk
execute if entity @s[scores={orbis_biome=0}] run function #orbis:biome/default
execute if entity @s[scores={orbis_biome=1}] run function #orbis:biome/ocean
execute if entity @s[scores={orbis_biome=2}] run function #orbis:biome/desert
execute if entity @s[scores={orbis_biome=3}] run function #orbis:biome/snow
execute if entity @s[scores={orbis_biome=4}] run function #orbis:biome/mesa

# restore the biome type that was first detected
# this makes sure all terrain is generated the same independed on which ones got generated first
scoreboard players operation @s orbis_biome = orbis_old_biome orbis_biome

# mark the chunk as generated
scoreboard players add orbis_generated gm4_count 1
fill ~ 0 ~ ~15 0 ~15 barrier replace bedrock
tag @s add orbis_generated

# clean up the adjacent tags
tag @e[tag=orbis_adjacent] remove orbis_adjacent
