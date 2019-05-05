#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = phantom_scarecrows gm4_clock_tick run function phantom_scarecrows:main

#controll rockets if any exist
execute as @e[type=area_effect_cloud,tag=gm4_phantom_scarecrow_rocket] at @s run function phantom_scarecrows:aim
