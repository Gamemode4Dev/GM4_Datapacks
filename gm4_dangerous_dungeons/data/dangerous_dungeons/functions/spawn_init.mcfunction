# spawn a dungeon based on the biome type.
execute if score structure_height gm4_count matches ..50 if entity @s[tag=gm4_dungeon,scores={gm4_orbis_biome=0}] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons_default"]}
execute if score structure_height gm4_count matches ..50 unless block ~ 3 ~ bedrock if entity @s[tag=gm4_dungeon,scores={gm4_orbis_biome=1}] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons_ocean"]}
execute if score structure_height gm4_count matches ..50 if entity @s[tag=gm4_dungeon,scores={gm4_orbis_biome=2}] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons_desert"]}
execute if score structure_height gm4_count matches ..50 if entity @s[tag=gm4_dungeon,scores={gm4_orbis_biome=3}] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons_snow"]}
execute if score structure_height gm4_count matches ..50 if entity @s[tag=gm4_dungeon,scores={gm4_orbis_biome=4}] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons_mesa"]}
