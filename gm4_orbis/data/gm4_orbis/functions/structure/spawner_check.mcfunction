# run from #gm4_spawner_minecarts:spawner_check

# Default spawners
execute unless score $valid_spawner gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{entity:{id:"minecraft:zombie",DeathLootTable:"gm4_orbis:entities/zombie"}}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{entity:{id:"minecraft:skeleton",DeathLootTable:"gm4_orbis:entities/skeleton"}}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{entity:{id:"minecraft:spider",DeathLootTable:"gm4_orbis:entities/spider"}}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{entity:{id:"minecraft:creeper",DeathLootTable:"gm4_orbis:entities/creeper"}}} run scoreboard players set $valid_spawner gm4_spawner_data 1

# Water spawners
execute unless score $valid_spawner gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{entity:{id:"minecraft:drowned",DeathLootTable:"gm4_orbis:entities/drowned"}}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{entity:{id:"minecraft:guardian",DeathLootTable:"gm4_orbis:entities/guardian"}}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{entity:{id:"minecraft:pufferfish",DeathLootTable:"gm4_orbis:entities/pufferfish"}}} run scoreboard players set $valid_spawner gm4_spawner_data 1
