
execute as @e[type=minecraft:wandering_trader,tag=!gm4_balloon_animal_eligible_ignore,tag=!smithed.entity] at @s run function gm4_balloon_animals:wandering_trader/check_eligibility

execute as @e[type=#gm4_balloon_animals:balloon_animal,tag=gm4_balloon_animal,tag=!gm4_balloon_animal_purchased] run function gm4_balloon_animals:balloon/check_leashed

schedule function gm4_balloon_animals:main 4s
