# spawn a dungeon based on the biome type.
execute if score structure_height gm4_count matches ..50 unless block ~ 3 ~ bedrock if score ocean gm4_orbis_biome matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons","gm4_dangerous_dungeons_ocean"]}
execute if score structure_height gm4_count matches ..50 if score desert gm4_orbis_biome matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons","gm4_dangerous_dungeons_desert"]}
execute if score structure_height gm4_count matches ..50 if score badlands gm4_orbis_biome matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons","gm4_dangerous_dungeons_badlands"]}
execute if score structure_height gm4_count matches ..50 if score snowy gm4_orbis_biome matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons","gm4_dangerous_dungeons_snowy"]}

execute unless entity @e[type=area_effect_cloud,tag=gm4_dangerous_dungeons,distance=..1] if score structure_height gm4_count matches ..50 run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_dangerous_dungeons","gm4_dangerous_dungeons_default"]}
