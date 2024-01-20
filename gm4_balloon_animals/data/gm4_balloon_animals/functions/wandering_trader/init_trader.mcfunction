# Adds animal trades to the trader's trade pool.
# @s = a wandering trader without the gm4_calling_bell_trader tag (aka naturally spawned trader) with exactly 2 trader llamas
# at @s
# run from gm4_balloon_animals:wandering_trader/check_eligibility

tag @s add gm4_balloon_animal_trader
tag @s add gm4_balloon_animal_trader_new

scoreboard players set $llamas_replaced gm4_balloon_animals_data 0

# find leashed llamas
execute as @e[type=trader_llama,distance=..6] run function gm4_balloon_animals:wandering_trader/llama/check_leasher

# pick two animals and set up trades
function gm4_balloon_animals:wandering_trader/pick_two_animals


# clean up
tag @s remove gm4_balloon_animal_trader_new
