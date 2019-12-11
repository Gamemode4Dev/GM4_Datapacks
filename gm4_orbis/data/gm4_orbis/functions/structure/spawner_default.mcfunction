# spawn a random spawner type based on the bedrock pattern
setblock ~ ~ ~ air
execute unless block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"zombie"},SpawnPotentials:[{Entity:{id:"zombie",DeathLootTable:"orbis:entities/zombie"}}]}
execute unless block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"skeleton"},SpawnPotentials:[{Entity:{id:"skeleton",DeathLootTable:"orbis:entities/skeleton"}}]}
execute if block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"spider"},SpawnPotentials:[{Entity:{id:"spider",DeathLootTable:"orbis:entities/spider"}}]}
execute if block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"creeper"},SpawnPotentials:[{Entity:{id:"creeper",DeathLootTable:"orbis:entities/creeper"}}]}
