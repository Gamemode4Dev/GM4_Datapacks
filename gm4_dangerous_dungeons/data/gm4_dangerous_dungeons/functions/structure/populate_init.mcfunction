execute if entity @s[tag=gm4_chest,tag=gm4_dungeon] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_populate_marker","gm4_orbis_dungeon_loot"]}
execute if entity @s[tag=gm4_spawner,tag=gm4_default_spawner] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_populate_marker","gm4_orbis_default_spawners"]}
execute if entity @s[tag=gm4_spawner,tag=gm4_water_spawner] run summon area_effect_cloud ~ ~ ~ {Tags:["gm4_orbis_populate_marker","gm4_orbis_water_spawners"]}
