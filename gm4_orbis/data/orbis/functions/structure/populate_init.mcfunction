execute if entity @s[tag=gm4_orbis_chest,tag=gm4_orbis_dungeon] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_populate_marker","gm4_orbis_dungeon_loot"]}
execute if entity @s[tag=gm4_orbis_chest,tag=gm4_orbis_tower] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_populate_marker","gm4_orbis_dungeon_loot"]}
execute if entity @s[tag=gm4_orbis_spawner,tag=gm4_orbis_default_spawner] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_populate_marker","gm4_orbis_default_spawners"]}
execute unless entity @s[tag=gm4_orbis_spawner,tag=gm4_orbis_water_spawner] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_populate_marker","gm4_orbis_water_spawners"]}
