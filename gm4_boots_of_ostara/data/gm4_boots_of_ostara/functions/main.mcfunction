execute as @a[gamemode=!spectator,gamemode=!adventure,predicate=gm4_boots_of_ostara:equipped_with_grass] at @s if block ~ ~-0.5 ~ dirt run setblock ~ ~-0.5 ~ grass_block
execute as @e[type=armor_stand,predicate=gm4_boots_of_ostara:armor_stand_grass] at @s if block ~ ~-0.5 ~ dirt run setblock ~ ~-0.5 ~ grass_block

schedule function gm4_boots_of_ostara:main 16t
