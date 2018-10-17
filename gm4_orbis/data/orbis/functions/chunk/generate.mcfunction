# if the chunk hasn't been scanned yet, scan it
execute if entity @s[tag=!gm4_orbis_scanned] run function orbis:gen/scan
# save the determined biome type for later
scoreboard players operation orbis_old_biome gm4_orbis_biome = @s gm4_orbis_biome

# make sure there are 4 scanned chunks adjacent
execute positioned ~16 ~ ~ unless entity @e[tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
execute positioned ~-16 ~ ~ unless entity @e[tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
execute positioned ~ ~ ~16 unless entity @e[tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}
execute positioned ~ ~ ~-16 unless entity @e[tag=gm4_chunk,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_chunk],Duration:2000000000}

tag @e[tag=gm4_chunk,distance=1..17] add adjacent
execute as @e[tag=gm4_chunk,tag=adjacent,tag=!gm4_orbis_scanned] at @s run function orbis:chunk/scan

# do various things to improve biome detection
function orbis:chunk/fix_biome

# run general and biome specific function tags
# other modules can have functions in these tags as expansion to orbis
function #orbis:chunk/generate
execute if entity @s[scores={gm4_orbis_biome=0}] run function #orbis:biome/default
execute if entity @s[scores={gm4_orbis_biome=1}] run function #orbis:biome/ocean
execute if entity @s[scores={gm4_orbis_biome=2}] run function #orbis:biome/desert
execute if entity @s[scores={gm4_orbis_biome=3}] run function #orbis:biome/snow
execute if entity @s[scores={gm4_orbis_biome=4}] run function #orbis:biome/mesa

# restore the biome type that was first detected
# this makes sure all terrain is generated the same independed on which ones got generated first
scoreboard players operation @s gm4_orbis_biome = orbis_old_biome gm4_orbis_biome

# mark the chunk as generated
scoreboard players add orbis_generated gm4_count 1
fill ~ 0 ~ ~15 0 ~15 barrier replace bedrock
tag @s add gm4_generated

# clean up the adjacent tags
tag @e[tag=gm4_chunk,tag=adjacent] remove adjacent
