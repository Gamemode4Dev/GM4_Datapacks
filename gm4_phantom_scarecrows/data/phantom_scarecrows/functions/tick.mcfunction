#controll rockets if any exist
execute as @e[type=area_effect_cloud,tag=gm4_phantom_scarecrow_rocket] at @s run function phantom_scarecrows:aim

schedule function phantom_scarecrows:tick 1t
