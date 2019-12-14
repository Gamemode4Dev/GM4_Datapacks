execute as @e[type=armor_stand,tag=gm4_turn_clockwise] at @s run tp @s ~ ~ ~ ~1 ~0
execute as @e[type=armor_stand,tag=gm4_turn_anticlockwise] at @s run tp @s ~ ~ ~ ~-1 ~0

schedule function gm4_better_armour_stands:tick 1t
