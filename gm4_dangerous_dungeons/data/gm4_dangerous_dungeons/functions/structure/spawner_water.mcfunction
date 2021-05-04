# spawn a random spawner type based on the bedrock pattern
setblock ~ ~ ~ air
execute unless block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"drowned"},SpawnPotentials:[{Entity:{id:"drowned",DeathLootTable:"gm4_dangerous_dungeons:entities/drowned",DeathTime:-81}}]}
execute unless block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"guardian"},SpawnPotentials:[{Entity:{id:"guardian",DeathLootTable:"gm4_dangerous_dungeons:entities/guardian",DeathTime:-81}}]}
execute if block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"guardian"},SpawnPotentials:[{Entity:{id:"guardian",DeathLootTable:"gm4_dangerous_dungeons:entities/guardian",DeathTime:-81}}]}
execute if block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"pufferfish"},SpawnPotentials:[{Entity:{id:"pufferfish",DeathLootTable:"gm4_dangerous_dungeons:entities/pufferfish"}}]}
