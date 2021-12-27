# adds Charged Creeper spawners
# run from #gm4_spawner_minecarts:spawner_check

execute unless score $valid_spawner gm4_spawner_data matches 1 if data storage gm4_spawner_minecarts:temp spawner{SpawnPotentials:[{data:{entity:{id:"minecraft:creeper",powered:1b,DeathLootTable:"gm4_lightning_in_a_bottle:entities/charged_creeper"}}}]} run scoreboard players set $valid_spawner gm4_spawner_data 1
