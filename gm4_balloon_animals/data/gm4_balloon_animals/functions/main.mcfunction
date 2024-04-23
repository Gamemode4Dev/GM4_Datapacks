
execute as @e[type=#gm4_balloon_animals:balloon_animal,tag=gm4_balloon_animal,tag=!gm4_balloon_animal_purchased] run function gm4_balloon_animals:balloon/check_leashed

schedule function gm4_balloon_animals:main 4s
