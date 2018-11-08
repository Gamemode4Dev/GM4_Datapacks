#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = better_armour_stands gm4_clockTick run function better_armour_stands:main

execute as @e[type=armor_stand,tag=gm4_turn_clockwise] at @s run tp @s ~ ~ ~ ~1 ~0
execute as @e[type=armor_stand,tag=gm4_turn_anticlockwise] at @s run tp @s ~ ~ ~ ~-1 ~0
