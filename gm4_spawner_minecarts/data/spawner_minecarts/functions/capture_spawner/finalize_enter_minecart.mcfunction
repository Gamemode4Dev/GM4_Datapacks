#@s = new spawner minecarts
#run from enter_minecart

data modify entity @s SpawnPotentials merge from block ~ ~1 ~ SpawnPotentials
data modify entity @s SpawnData merge from block ~ ~1 ~ SpawnData
data modify entity @s SpawnCount merge from block ~ ~1 ~ SpawnCount
data modify entity @s SpawnRange merge from block ~ ~1 ~ SpawnRange
data modify entity @s MaxNearbyEntities merge from block ~ ~1 ~ MaxNearbyEntities
setblock ~ ~1 ~ air destroy
scoreboard players set @s gm4_spawner_fuel 2000
scoreboard players operation @s gm4_spawner_time = spawner_global_time gm4_spawner_time
advancement grant @a[gamemode=!spectator,distance=..5] only gm4:spawner_minecarts
tag @s remove gm4_init
