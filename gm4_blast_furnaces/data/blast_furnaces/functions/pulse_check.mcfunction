#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = blast_furnaces gm4_clockTick run function blast_furnaces:main


execute as @e[tag=gm4_bf_is_smelting] at @s run function blast_furnaces:double_ore
