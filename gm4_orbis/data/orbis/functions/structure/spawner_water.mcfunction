setblock ~ ~ ~ air
execute unless block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"drowned"},SpawnPotentials:[{Entity:{id:"drowned"}}]}
execute unless block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"drowned"},SpawnPotentials:[{Entity:{id:"drowned"}}]}
execute if block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"guardian"},SpawnPotentials:[{Entity:{id:"guardian"}}]}
execute if block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnData:{id:"pufferfish"},SpawnPotentials:[{Entity:{id:"pufferfish"}}]}
