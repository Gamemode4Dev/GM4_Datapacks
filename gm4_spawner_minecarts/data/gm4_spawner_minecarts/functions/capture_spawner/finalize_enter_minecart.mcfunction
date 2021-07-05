#@s = new spawner minecarts
#run from enter_minecart
setblock ~ ~1 ~ air destroy
data modify entity @s {} merge from storage gm4_spawner_minecarts:temp spawner
scoreboard players set @s gm4_spawner_fuel 2000
scoreboard players operation @s gm4_spawner_time = spawner_global_time gm4_spawner_time
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:spawner_minecarts
kill @e[type=minecart,limit=1,distance=0]
