#@s = minecarts under spawners
#run from main

scoreboard players set $valid_spawner gm4_spawner_data 0
data modify storage gm4_spawner_minecarts:temp spawner set from block ~ ~1 ~
function #gm4_spawner_minecarts:spawner_check

execute if score $valid_spawner gm4_spawner_data matches 1.. run summon spawner_minecart ~ ~ ~ {Tags:["gm4_spawner_minecart"],MaxNearbyEntities:6s,RequiredPlayerRange:16s,SpawnCount:4s,SpawnData:{entity:{id:"minecraft:pig"}},MaxSpawnDelay:600s,Delay:171s,SpawnRange:4s,MinSpawnDelay:100s,SpawnPotentials:[{data:{entity:{id:"minecraft:pig"}},weight:1}],Invulnerable:1b}
execute if score $valid_spawner gm4_spawner_data matches 1.. as @e[tag=gm4_spawner_minecart,limit=1,distance=..1] run function gm4_spawner_minecarts:capture_spawner/finalize_enter_minecart
execute if score $valid_spawner gm4_spawner_data matches 1.. run kill @s
