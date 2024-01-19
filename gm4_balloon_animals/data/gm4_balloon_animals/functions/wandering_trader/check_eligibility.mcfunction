# Checks the eligibility of the wandering trader to become an animal trader
# @s = a wandering trader
# at @s
# run from #gm4_trades:register_trades

scoreboard players set $valid_trader gm4_balloon_animals_data 1

# check tags
execute if entity @s[tag=gm4_balloon_animal_eligible_ignore] run scoreboard players set $valid_trader gm4_balloon_animals_data 0
execute if entity @s[tag=gm4_calling_bell_trader] run scoreboard players set $valid_trader gm4_balloon_animals_data 0

# must have 2 llamas
execute store result score $trader_llama_count gm4_balloon_animals_data if entity @e[type=trader_llama,distance=..6]
execute unless score $trader_llama_count gm4_balloon_animals_data matches 2 run scoreboard players set $valid_trader gm4_balloon_animals_data 0

tag @s add gm4_balloon_animal_eligible_ignore
execute if score $valid_trader gm4_balloon_animals_data matches 1 if predicate gm4_balloon_animals:balloon_trader_chance run function gm4_balloon_animals:wandering_trader/init_trader
