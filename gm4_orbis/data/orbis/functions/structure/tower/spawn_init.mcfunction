# spawn a tower based on the biome type.
# structure height is the number of blocks below y=200
# eg. score=50 means structure at y=150
# a tower in a snow biome needs to be above y=70
# a tower in any other biomes needs to be above y=80
execute if score structure_height gm4_count matches 80..200 if entity @s[tag=gm4_tower,scores={gm4_orbis_biome=0}] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_spawn_marker,gm4_orbis_default_tower]}
execute if score structure_height gm4_count matches 80..200 if entity @s[tag=gm4_tower,scores={gm4_orbis_biome=2}] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_spawn_marker,gm4_orbis_desert_tower]}
execute if score structure_height gm4_count matches 70..200 if entity @s[tag=gm4_tower,scores={gm4_orbis_biome=3}] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_spawn_marker,gm4_orbis_snow_tower]}
execute if score structure_height gm4_count matches 80..200 if entity @s[tag=gm4_tower,scores={gm4_orbis_biome=4}] run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_spawn_marker,gm4_orbis_mesa_tower]}
