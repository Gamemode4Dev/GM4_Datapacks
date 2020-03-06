#@s = soul glass AEC
#run from main

execute unless block ~ ~ ~ brown_stained_glass run kill @s
execute if block ~ ~ ~ brown_stained_glass unless block ~ ~-1 ~ beacon run function gm4_soul_glass:destroy

particle minecraft:smoke ~ ~ ~ 0.3 0.3 0.3 0 15 normal
