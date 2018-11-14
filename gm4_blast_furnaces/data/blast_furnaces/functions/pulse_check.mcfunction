#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = blast_furnaces gm4_clockTick run function blast_furnaces:main


execute as @e[type=armor_stand,tag=gm4_bf_has_ore] at @s if block ^ ^ ^1 furnace[lit=true]{CookTime:199s} run function #blast_furnaces:execute_recipe
