#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = better_armour_stands gm4_clock_tick run function better_armour_stands:main

execute as @e[type=armor_stand,tag=gm4_turn_clockwise] at @s run tp @s ~ ~ ~ ~1 ~0
execute as @e[type=armor_stand,tag=gm4_turn_anticlockwise] at @s run tp @s ~ ~ ~ ~-1 ~0
