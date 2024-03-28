# @s = a wandering trader
# at @s
# run from #gm4_trades:register_trades

scoreboard players set $valid_trader gm4_balloon_animals_data 1

# check tags
execute if entity @s[tag=gm4_balloon_animal_eligible_ignore] run scoreboard players set $valid_trader gm4_balloon_animals_data 0
execute if entity @s[tag=gm4_calling_bell_trader] run scoreboard players set $valid_trader gm4_balloon_animals_data 0

data modify storage gm4_balloon_animals:temp trader.uuid set from entity @s UUID
tag @s add gm4_balloon_animal_trader_eligible_check

# must have 2 llamas leashed
scoreboard players set $trader_llama_count gm4_balloon_animals_data 0
execute as @e[type=trader_llama,tag=!smithed.entity,distance=..6] on leasher if entity @s[tag=gm4_balloon_animal_trader_eligible_check] run scoreboard players add $trader_llama_count gm4_balloon_animals_data 1
execute unless score $trader_llama_count gm4_balloon_animals_data matches 2 run scoreboard players set $valid_trader gm4_balloon_animals_data 0

tag @s add gm4_balloon_animal_eligible_ignore
tag @s remove gm4_balloon_animal_trader_eligible_check
execute if score $valid_trader gm4_balloon_animals_data matches 1 if predicate gm4_balloon_animals:balloon_trader_chance run function gm4_balloon_animals:wandering_trader/init_trader

# clean up
scoreboard players reset $trader_llama_count gm4_balloon_animals_data
