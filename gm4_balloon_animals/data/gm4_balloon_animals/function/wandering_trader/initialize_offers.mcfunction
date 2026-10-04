# @s = wandering trader
# run from wandering_trader/interacted

data modify entity @s Offers.Recipes append from entity @s data.gm4_balloon_animals.trades[]
data remove entity @s data.gm4_balloon_animals.trades

tag @s add gm4_balloon_animal_offers_initialized
