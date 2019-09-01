#run from pulse_check if there's a furnace next to a blast furnace with a cook time > 182

execute as @e[tag=gm4_blast_furnace,scores={gm4_bf_dir=0,gm4_bf_data=183..}] at @s if block ~1 ~ ~ furnace{CookTime:199s} run function blast_furnaces:check_validity/0
execute as @e[tag=gm4_blast_furnace,scores={gm4_bf_dir=1,gm4_bf_data=183..}] at @s if block ~ ~ ~1 furnace{CookTime:199s} run function blast_furnaces:check_validity/1
execute as @e[tag=gm4_blast_furnace,scores={gm4_bf_dir=2,gm4_bf_data=183..}] at @s if block ~-1 ~ ~ furnace{CookTime:199s} run function blast_furnaces:check_validity/2
execute as @e[tag=gm4_blast_furnace,scores={gm4_bf_dir=3,gm4_bf_data=183..}] at @s if block ~ ~ ~-1 furnace{CookTime:199s} run function blast_furnaces:check_validity/3
