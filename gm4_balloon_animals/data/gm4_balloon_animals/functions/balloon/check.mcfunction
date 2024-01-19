# Verifies unpurchased balloon animals are still leashed to a wandering trader
# @s = animal, tag=gm4_balloon_animal,tag=!gm4_balloon_animal_purchased
# at world spawn
# run from gm4_balloon_animal:main

execute store success score $leashed gm4_balloon_animals_data if data entity @s Leash 
execute if score $leashed gm4_balloon_animals_data matches 1 store success score $leashed gm4_balloon_animals_data on leasher if entity @s[type=wandering_trader]
execute if score $leashed gm4_balloon_animals_data matches 0 run function gm4_balloon_animals:balloon/fly_away/start

# prevent aging
data modify entity @s Age set value -2147483648
