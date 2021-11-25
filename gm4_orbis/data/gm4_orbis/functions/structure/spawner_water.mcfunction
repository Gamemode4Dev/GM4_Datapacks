# spawn a random spawner type based on the bedrock pattern
setblock ~ ~ ~ air
execute unless block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{data:{entity:{id:"drowned",DeathLootTable:"gm4_orbis:entities/drowned"}}}]}
execute unless block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{data:{entity:{id:"guardian",DeathLootTable:"gm4_orbis:entities/guardian"}}}]}
execute if block ~ 3 ~ bedrock unless block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{data:{entity:{id:"guardian",DeathLootTable:"gm4_orbis:entities/guardian"}}}]}
execute if block ~ 3 ~ bedrock if block ~ 4 ~ bedrock run setblock ~ ~ ~ spawner{SpawnPotentials:[{data:{entity:{id:"pufferfish",DeathLootTable:"gm4_orbis:entities/pufferfish"}}}]}
