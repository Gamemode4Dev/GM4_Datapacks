execute as @a[predicate=gm4_boots_of_ostara:boots_equipped] at @s run function gm4_boots_of_ostara:active
execute as @e[type=armor_stand,predicate=gm4_boots_of_ostara:boots_equipped,predicate=gm4_boots_of_ostara:holding_grass] at @s if block ~ ~-0.5 ~ dirt run setblock ~ ~-0.5 ~ grass_block

schedule function gm4_boots_of_ostara:main 16t
