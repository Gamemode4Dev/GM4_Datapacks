# spawn a random spawner type based on the bedrock pattern
setblock ~ ~ ~ air
execute unless block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{data:{entity:{id:"zombie",DeathLootTable:"gm4_orbis:entities/zombie"}}}]}
execute unless block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{data:{entity:{id:"skeleton",DeathLootTable:"gm4_orbis:entities/skeleton"}}}]}
execute if block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{data:{entity:{id:"spider",DeathLootTable:"gm4_orbis:entities/spider"}}}]}
execute if block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{data:{entity:{id:"creeper",DeathLootTable:"gm4_orbis:entities/creeper"}}}]}
