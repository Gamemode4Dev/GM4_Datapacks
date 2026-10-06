# @s = player that just interacted with a non-processed wandering trader
# run from advancement gm4_balloon_animals:interacted

advancement revoke @s only gm4_balloon_animals:interacted

execute as @e[type=minecraft:wandering_trader,tag=gm4_balloon_animal_trader,tag=!gm4_balloon_animal_offers_initialized,tag=!smithed.entity] if data entity @s Offers.Recipes[0] if data entity @s data.gm4_balloon_animals.trades[0] at @s run function gm4_balloon_animals:wandering_trader/initialize_offers
