# Picks a common animal to be spawned as the second animal
# @s = a wandering trader without the gm4_calling_bell_trader tag (aka naturally spawned trader) with exactly 2 trader llamas
# at @s
# from gm4_balloon_animals:wandering_trader/pick_two_animals

execute if score $a2_choice gm4_balloon_animals_data matches 0 summon cow run function gm4_balloon_animals:wandering_trader/animal_two/init_animal_trade
execute if score $a2_choice gm4_balloon_animals_data matches 1 summon pig run function gm4_balloon_animals:wandering_trader/animal_two/init_animal_trade
execute if score $a2_choice gm4_balloon_animals_data matches 2 summon sheep run function gm4_balloon_animals:wandering_trader/animal_two/init_animal_trade
execute if score $a2_choice gm4_balloon_animals_data matches 3 summon horse run function gm4_balloon_animals:wandering_trader/animal_two/init_animal_trade
execute if score $a2_choice gm4_balloon_animals_data matches 4 summon rabbit run function gm4_balloon_animals:wandering_trader/animal_two/init_animal_trade
execute if score $a2_choice gm4_balloon_animals_data matches 5 summon wolf run function gm4_balloon_animals:wandering_trader/animal_two/init_animal_trade
execute if score $a2_choice gm4_balloon_animals_data matches 6 summon llama run function gm4_balloon_animals:wandering_trader/animal_two/init_animal_trade
execute if score $a2_choice gm4_balloon_animals_data matches 7 summon frog run function gm4_balloon_animals:wandering_trader/animal_two/init_animal_trade

execute if score $a2_choice gm4_balloon_animals_data matches 8 run function gm4_balloon_animals:wandering_trader/trade/add_chicken_egg
execute if score $a2_choice gm4_balloon_animals_data matches 9 run function gm4_balloon_animals:wandering_trader/trade/add_bee_nest