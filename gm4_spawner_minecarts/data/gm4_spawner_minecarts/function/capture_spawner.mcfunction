# try to pick up spawner with minecart
# @s = minecarts under spawners
# at @s
# run from main

# get spawner data
data modify storage gm4_spawner_minecarts:temp spawner set from block ~ ~1 ~

# check if this spawner is blacklisted
execute if data storage gm4_spawner_minecarts:temp spawner.SpawnPotentials[{data:{entity:{data:{gm4_spawner_minecrarts:{ban_pickup:1}}}}}] run return run function gm4_spawner_minecarts:capture_spawner/fail_pickup
execute if data storage gm4_spawner_minecarts:temp spawner.SpawnData[{data:{entity:{data:{gm4_spawner_minecrarts:{ban_pickup:1}}}}}] run return run function gm4_spawner_minecarts:capture_spawner/fail_pickup

# pick up spawner
summon spawner_minecart ~ ~ ~ {Tags:["gm4_spawner_minecart","gm4_spawner_minecart.new"],MaxNearbyEntities:6,RequiredPlayerRange:16,SpawnCount:4,SpawnData:{entity:{id:"minecraft:pig"}},MaxSpawnDelay:600s,Delay:-1,SpawnRange:4s,MinSpawnDelay:100s,SpawnPotentials:[],Invulnerable:1b}
setblock ~ ~1 ~ air destroy
data modify entity @e[tag=gm4_spawner_minecart.new,limit=1,distance=..1] {} merge from storage gm4_spawner_minecarts:temp spawner
tag @e[tag=gm4_spawner_minecart.new,limit=1,distance=..1] remove gm4_spawner_minecart.new
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:spawner_minecarts
kill @s
