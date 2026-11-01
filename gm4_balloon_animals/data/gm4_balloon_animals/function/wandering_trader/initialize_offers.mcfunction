# @s = wandering trader
# at @s
# run from wandering_trader/interacted

data modify entity @s Offers.Recipes append from entity @s data.gm4_balloon_animals.trades[]
data remove entity @s data.gm4_balloon_animals.trades

tag @s add gm4_balloon_animal_offers_initialized

particle minecraft:happy_villager ~ ~2 ~ 0.5 0.5 0.5 0 5
