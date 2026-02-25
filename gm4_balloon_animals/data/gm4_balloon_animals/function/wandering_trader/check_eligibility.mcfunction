# @s = a wandering trader
# at @s
# run from gm4_balloon_animals:main

# ensure that this wandering trader is not checked again
tag @s add gm4_balloon_animal_eligible_ignore

execute unless predicate gm4_balloon_animals:balloon_trader_chance run return 0

# must have 2 llamas leashed
scoreboard players set $trader_llama_count gm4_balloon_animals_data 0
tag @s add gm4_balloon_animal_trader_eligible_check
execute as @e[type=trader_llama,tag=!smithed.entity,distance=..6] on leasher if entity @s[tag=gm4_balloon_animal_trader_eligible_check] run scoreboard players add $trader_llama_count gm4_balloon_animals_data 1
tag @s remove gm4_balloon_animal_trader_eligible_check
execute unless score $trader_llama_count gm4_balloon_animals_data matches 2 run return 0
scoreboard players reset $trader_llama_count gm4_balloon_animals_data

data modify storage gm4_balloon_animals:temp trader.uuid set from entity @s UUID
function gm4_balloon_animals:wandering_trader/init_trader
