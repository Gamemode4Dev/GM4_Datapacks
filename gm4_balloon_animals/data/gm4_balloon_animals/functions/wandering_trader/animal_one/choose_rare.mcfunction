# Picks a rare animal to be spawned as the first trade
# @s = a wandering trader without the gm4_calling_bell_trader tag (aka naturally spawned trader) with exactly 2 trader llamas
# at @s
# from gm4_balloon_animals:wandering_trader/pick_two_animals

execute if score $a1_choice gm4_balloon_animals_data matches 0 summon fox run function gm4_balloon_animals:wandering_trader/animal_one/init_animal_trade
execute if score $a1_choice gm4_balloon_animals_data matches 1 summon parrot run function gm4_balloon_animals:wandering_trader/animal_one/init_animal_trade
execute if score $a1_choice gm4_balloon_animals_data matches 2 summon donkey run function gm4_balloon_animals:wandering_trader/animal_one/init_animal_trade
execute if score $a1_choice gm4_balloon_animals_data matches 3 summon panda run function gm4_balloon_animals:wandering_trader/animal_one/init_animal_trade
execute if score $a1_choice gm4_balloon_animals_data matches 4 summon camel run function gm4_balloon_animals:wandering_trader/animal_one/init_animal_trade
execute if score $a1_choice gm4_balloon_animals_data matches 5 summon goat run function gm4_balloon_animals:wandering_trader/animal_one/init_animal_trade
execute if score $a1_choice gm4_balloon_animals_data matches 6 summon ocelot run function gm4_balloon_animals:wandering_trader/animal_one/init_animal_trade

execute if score $a1_choice gm4_balloon_animals_data matches 7 run function gm4_balloon_animals:wandering_trader/trade/add_turtle_egg
