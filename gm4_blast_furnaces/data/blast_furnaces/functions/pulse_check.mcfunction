#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = blast_furnaces gm4_clock_tick run function blast_furnaces:main

execute as @e[tag=gm4_blast_furnace,tag=gm4_blast_furnace_valid] at @s run function blast_furnaces:double
