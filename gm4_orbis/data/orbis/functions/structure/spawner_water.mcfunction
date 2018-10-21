# spawn a random spawner type based on the bedrock pattern
setblock ~ ~ ~ air
execute unless block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"drowned"},SpawnPotentials:[{Entity:{id:"drowned",DeathLootTable:"orbis:entities/drowned"}}]}
execute unless block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"drowned"},SpawnPotentials:[{Entity:{id:"drowned",DeathLootTable:"orbis:entities/drowned"}}]}
execute if block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"guardian"},SpawnPotentials:[{Entity:{id:"guardian",DeathLootTable:"orbis:entities/guardian"}}]}
execute if block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"pufferfish"},SpawnPotentials:[{Entity:{id:"pufferfish",DeathLootTable:"orbis:entities/pufferfish"}}]}
