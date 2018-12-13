# spawn a tower based on the biome type.
execute if score structure_height gm4_count matches 80..200 if entity @s[tag=gm4_tower,scores={gm4_orbis_biome=0}] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_spawn_marker,gm4_orbis_default_tower]}
execute if score structure_height gm4_count matches 80..200 if entity @s[tag=gm4_tower,scores={gm4_orbis_biome=2}] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_spawn_marker,gm4_orbis_desert_tower]}
execute if score structure_height gm4_count matches 80..200 if entity @s[tag=gm4_tower,scores={gm4_orbis_biome=3}] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_spawn_marker,gm4_orbis_snow_tower]}
execute if score structure_height gm4_count matches 80..200 if entity @s[tag=gm4_tower,scores={gm4_orbis_biome=4}] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_spawn_marker,gm4_orbis_mesa_tower]}
