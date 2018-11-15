#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = blast_furnaces gm4_clock_tick run function blast_furnaces:main


execute as @e[type=armor_stand,tag=gm4_bf_has_ore] at @s if block ^ ^ ^1 furnace[lit=true]{CookTime:199s} run function #blast_furnaces:execute_recipe
