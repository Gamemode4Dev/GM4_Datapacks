# spawn a tower based on the biome type.
execute if score structure_height gm4_count matches 60.. if block ~ ~ ~ water if block ~ 40 ~ water if block ~ 3 ~ bedrock if block ~ 4 ~ bedrock if score ocean gm4_orbis_biome matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_tower_structures","gm4_tower_structures_ocean"]}
execute if score structure_height gm4_count matches 80.. if score desert gm4_orbis_biome matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_tower_structures","gm4_tower_structures_desert"]}
execute if score structure_height gm4_count matches 80.. if score snowy gm4_orbis_biome matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_tower_structures","gm4_tower_structures_snowy"]}
execute if score structure_height gm4_count matches 80.. if score badlands gm4_orbis_biome matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_tower_structures","gm4_tower_structures_badlands"]}

execute unless entity @e[type=area_effect_cloud,tag=gm4_tower_structures,distance=..1] if score structure_height gm4_count matches 80.. run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_tower_structures","gm4_tower_structures_default"]}
