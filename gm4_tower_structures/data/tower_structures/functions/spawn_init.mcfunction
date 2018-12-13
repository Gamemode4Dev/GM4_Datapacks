# spawn a dungeon based on the biome type.
execute if score structure_height gm4_count matches ..50 if entity @s[tag=gm4_dungeon,scores={gm4_orbis_biome=0}] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_tower_structures_default"]}
execute if score structure_height gm4_count matches ..50 if entity @s[tag=gm4_dungeon,scores={gm4_orbis_biome=2}] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_tower_structures_desert"]}
execute if score structure_height gm4_count matches ..50 if entity @s[tag=gm4_dungeon,scores={gm4_orbis_biome=3}] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_tower_structures_snow"]}
execute if score structure_height gm4_count matches ..50 if entity @s[tag=gm4_dungeon,scores={gm4_orbis_biome=4}] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_spawn_marker","gm4_tower_structures_mesa"]}
