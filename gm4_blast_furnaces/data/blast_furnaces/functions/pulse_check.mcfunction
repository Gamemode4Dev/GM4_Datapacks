#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = blast_furnaces gm4_clock_tick as @e[tag=gm4_blast_furnace] at @s run function blast_furnaces:main

execute if score blast_furnace_cooking gm4_bf_data matches 1 run function blast_furnaces:prepare_for_smelt
