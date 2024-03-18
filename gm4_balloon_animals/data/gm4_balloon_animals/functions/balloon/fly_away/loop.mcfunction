# Loop for balloon animal flying away
# @s = orphaned animal, tag=gm4_balloon_animal,tag=gm4_balloon_animal_purchased
# run from gm4_balloon_animal:balloon/start

execute as @e[type=#gm4_balloon_animals:balloon_animal,tag=gm4_balloon_animal_fly_away] run function gm4_balloon_animals:balloon/fly_away/animate

execute if entity @e[type=#gm4_balloon_animals:balloon_animal,tag=gm4_balloon_animal_fly_away,limit=1] run schedule function gm4_balloon_animals:balloon/fly_away/loop 16t
