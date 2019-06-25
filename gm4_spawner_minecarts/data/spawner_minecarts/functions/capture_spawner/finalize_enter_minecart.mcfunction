#@s = new spawner minecarts
#run from enter_minecart

data modify entity @s {} merge from block ~ ~1 ~ {}
setblock ~ ~1 ~ air destroy
scoreboard players set @s gm4_spawner_fuel 2000
scoreboard players operation @s gm4_spawner_time = spawner_global_time gm4_spawner_time
advancement grant @a[gamemode=!spectator,distance=..5] only gm4:spawner_minecarts
tag @s remove gm4_init
