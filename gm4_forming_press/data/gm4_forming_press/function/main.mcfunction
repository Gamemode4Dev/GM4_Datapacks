# process machine
execute as @e[type=marker,tag=gm4_forming_press] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function gm4_forming_press:recipe_validity_check

schedule function gm4_forming_press:main 16t
