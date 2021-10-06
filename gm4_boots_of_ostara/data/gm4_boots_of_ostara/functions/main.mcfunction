execute as @a[gamemode=!spectator,gamemode=!adventure,predicate=gm4_boots_of_ostara:boots_equipped] at @s run function gm4_boots_of_ostara:player_convert
execute as @e[type=armor_stand,predicate=gm4_boots_of_ostara:boots_equipped] at @s run function gm4_boots_of_ostara:armor_stand_convert

schedule function gm4_boots_of_ostara:main 16t
