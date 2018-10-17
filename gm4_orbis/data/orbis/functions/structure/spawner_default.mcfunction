# spawn a random spawner type based on the bedrock pattern
setblock ~ ~ ~ air
execute unless block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"zombie"},SpawnPotentials:[{Entity:{id:"zombie",DeathTime:-81}}]}
execute unless block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"skeleton"},SpawnPotentials:[{Entity:{id:"skeleton",DeathTime:-81}}]}
execute if block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"spider"},SpawnPotentials:[{Entity:{id:"spider",DeathTime:-81}}]}
execute if block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"creeper"},SpawnPotentials:[{Entity:{id:"creeper",DeathTime:-81}}]}
