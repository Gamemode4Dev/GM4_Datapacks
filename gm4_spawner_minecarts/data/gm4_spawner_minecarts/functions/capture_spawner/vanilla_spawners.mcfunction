#@s = minecarts under spawners
#run from enter_minecart via the #spawner_check tag

execute store result score #tags gm4_spawner_data run data get storage gm4_spawner_minecarts:temp spawner.SpawnPotentials[0].Entity

execute unless score $valid_spawner gm4_spawner_data matches 1 if score #tags gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{id:"minecraft:zombie"}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if score #tags gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{id:"minecraft:skeleton"}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if score #tags gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{id:"minecraft:spider"}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if score #tags gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{id:"minecraft:cave_spider"}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if score #tags gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{id:"minecraft:silverfish"}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if score #tags gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{id:"minecraft:blaze"}} run scoreboard players set $valid_spawner gm4_spawner_data 1
execute unless score $valid_spawner gm4_spawner_data matches 1 if score #tags gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnData:{id:"minecraft:magma_cube"}} run scoreboard players set $valid_spawner gm4_spawner_data 1
