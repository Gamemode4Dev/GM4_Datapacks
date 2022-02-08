# spawn a random spawner type based on the bedrock pattern

setblock ~ ~ ~ air
execute unless block ~ -61 ~ bedrock unless block ~ -60 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{weight:1,data:{entity:{id:"zombie",DeathLootTable:"gm4_orbis:entities/zombie"}}}]}
execute unless block ~ -61 ~ bedrock if block ~ -60 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{weight:1,data:{entity:{id:"skeleton",DeathLootTable:"gm4_orbis:entities/skeleton"}}}]}
execute if block ~ -61 ~ bedrock unless block ~ -60 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{weight:1,data:{entity:{id:"spider",DeathLootTable:"gm4_orbis:entities/spider"}}}]}
execute if block ~ -61 ~ bedrock if block ~ -60 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{weight:1,data:{entity:{id:"creeper",DeathLootTable:"gm4_orbis:entities/creeper"}}}]}
