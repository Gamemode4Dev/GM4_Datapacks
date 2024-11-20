# Granted upon purchasing a balloon animal from a wandering trader
# @s = trading player
# at @s
# run from advancement purchased_animal

scoreboard players reset $trade_success gm4_balloon_animals_data

data modify storage gm4_balloon_animals:temp player.uuid set from entity @s UUID

# locate trader
execute as @e[type=wandering_trader,tag=gm4_balloon_animal_trader,limit=1,sort=nearest] run function gm4_balloon_animals:purchase/trader/search

execute if score $trade_success gm4_balloon_animals_data matches 1 run advancement grant @s only gm4:balloon_animals
execute unless score $trade_success gm4_balloon_animals_data matches 1 run give @s emerald 12

# clean up
advancement revoke @s only gm4_balloon_animals:purchased_animal

clear @s lead[custom_data~{gm4_balloon_animals:{trade:1b}}|custom_data~{gm4_balloon_animals:{trade:2b}}]

scoreboard players reset $trade_applicable gm4_balloon_animals_data
scoreboard players reset $trade_count gm4_balloon_animals_data
scoreboard players reset $uses gm4_balloon_animals_data

tag @e[type=wandering_trader,tag=gm4_balloon_animal_trader_processed] remove gm4_balloon_animal_trader_processed
