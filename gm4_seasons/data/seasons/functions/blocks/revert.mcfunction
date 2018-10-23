#run from seasons:general/clock_tick


execute if entity @e[tag=gm4_szn_block,nbt={Age:35970}] as @e[tag=gm4_szn_block,nbt={Age:35970}] at @s unless block ~ ~ ~ air run tag @s add gm4_szn_revert

execute if entity @e[tag=gm4_szn_snow,nbt={Age:5970}] as @e[tag=gm4_szn_snow,nbt={Age:5970}] at @s unless block ~ ~ ~ air run tag @s add gm4_szn_revert