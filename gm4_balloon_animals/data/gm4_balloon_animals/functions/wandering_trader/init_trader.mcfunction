# @s = a wandering trader with exactly 2 trader llamas
# at @s
# run from wandering_trader/check_eligibility via #gm4_trades:register_trades

tag @s add gm4_balloon_animal_trader
tag @s add gm4_balloon_animal_trader_new

scoreboard players set $llamas_replaced gm4_balloon_animals_data 0

# find leashed llamas
execute as @e[type=trader_llama,tag=!smithed.entity,distance=..6] run function gm4_balloon_animals:wandering_trader/llama/check_leasher

# pick two animals and set up trades
function gm4_balloon_animals:wandering_trader/pick_two_animals


# clean up
scoreboard players reset $trader_llama_check gm4_balloon_animals_data

tag @s remove gm4_balloon_animal_trader_new
