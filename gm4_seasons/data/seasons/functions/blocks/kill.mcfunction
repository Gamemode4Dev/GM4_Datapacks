#run from seasons:blocks/global


execute as @e[tag=gm4_szn_poppy] at @s unless block ~ ~ ~ poppy run kill @s
execute as @e[tag=gm4_szn_dandelion] at @s unless block ~ ~ ~ dandelion run kill @s
execute as @e[tag=gm4_szn_grass] at @s unless block ~ ~ ~ grass run kill @s
execute as @e[tag=gm4_szn_dead_bush] at @s unless block ~ ~ ~ dead_bush run kill @s
execute as @e[tag=gm4_szn_coarse_dirt] at @s unless block ~ ~ ~ coarse_dirt run kill @s
execute as @e[tag=gm4_szn_ice] at @s unless block ~ ~ ~ ice unless block ~ ~ ~ packed_ice unless block ~ ~ ~ blue_ice run kill @s
execute as @e[tag=gm4_szn_packed_ice] at @s unless block ~ ~ ~ packed_ice unless block ~ ~ ~ blue_ice run kill @s
execute as @e[tag=gm4_szn_blue_ice] at @s unless unless block ~ ~ ~ blue_ice run kill @s
execute as @e[tag=gm4_szn_snow] at @s unless block ~ ~ ~ snow run kill @s
execute as @e[tag=gm4_szn_snow+] at @s unless block ~ ~ ~ snow run kill @s


execute at @e[tag=gm4_szn_revert,tag=gm4_szn_poppy] if block ~ ~ ~ poppy run setblock ~ ~ ~ air
execute at @e[tag=gm4_szn_revert,tag=gm4_szn_dandelion] if block ~ ~ ~ dandelion run setblock ~ ~ ~ air
execute at @e[tag=gm4_szn_revert,tag=gm4_szn_grass] if block ~ ~ ~ grass run setblock ~ ~ ~ air
execute at @e[tag=gm4_szn_revert,tag=gm4_szn_dead_bush] if block ~ ~ ~ dead_bush run setblock ~ ~ ~ grass
execute at @e[tag=gm4_szn_revert,tag=gm4_szn_coarse_dirt] if block ~ ~ ~ coarse_dirt run setblock ~ ~ ~ dirt
execute at @e[tag=gm4_szn_revert,tag=gm4_szn_ice] if block ~ ~ ~ ice run setblock ~ ~ ~ water
execute at @e[tag=gm4_szn_revert,tag=gm4_szn_packed_ice] if block ~ ~ ~ packed_ice run setblock ~ ~ ~ ice
execute at @e[tag=gm4_szn_revert,tag=gm4_szn_blue_ice] if block ~ ~ ~ blue_ice run setblock ~ ~ ~ packed_ice
execute at @e[tag=gm4_szn_revert,tag=gm4_szn_snow] if block ~ ~ ~ snow run setblock ~ ~ ~ air
execute at @e[tag=gm4_szn_revert,tag=gm4_szn_snow+] if block ~ ~ ~ snow run setblock ~ ~ ~ snow[layers=1]