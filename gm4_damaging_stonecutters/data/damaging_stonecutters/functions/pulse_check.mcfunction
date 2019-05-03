#compares assigned run tick to current tick and calls main
#execute if score current_tick gm4_clock_tick = damaging_stonecutters gm4_clock_tick run function damaging_stonecutters:main

execute as @e[type=!#damaging_stonecutters:stonecutter_immune] at @s run function damaging_stonecutters:check_block
