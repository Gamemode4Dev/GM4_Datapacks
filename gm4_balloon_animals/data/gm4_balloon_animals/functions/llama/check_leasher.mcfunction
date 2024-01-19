# Checks that this trader llama is attached to the wandering trader that is being checked
# @s = a llama within 5 blocks of the wandering trader being checked
# at @s
# from gm4_balloon_animals:wandering_trader/register_trade

execute store result score $trader_llama_check gm4_balloon_animals_data on leasher if entity @s[tag=gm4_balloon_animal_trader_new]
execute if score $trader_llama_check gm4_balloon_animals_data matches 1 run function gm4_balloon_animals:llama/kill
