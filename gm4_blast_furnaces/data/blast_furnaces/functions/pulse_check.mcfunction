#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = blast_furnaces gm4_clock_tick run function blast_furnaces:main

execute as @e[type=armor_stand,tag=gm4_blast_furnace,tag=gm4_bf_could_smelt] at @s if block ^ ^ ^1 furnace{CookTime:199s} run function blast_furnaces:smelt
