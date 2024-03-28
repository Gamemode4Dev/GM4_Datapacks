# Update the uses count for balloon animal trader's trade
# @s = wandering trader, tag=gm4_balloon_animal_trader
# at player
# run from purchase/trades/check_trade

# update trade, such that uses (2) > maxUses (1)
data modify storage gm4_balloon_animals:temp temp_source[-1].uses set value 2

# update trader with the updated trade
data modify storage gm4_balloon_animals:temp temp_source append from storage gm4_balloon_animals:temp trades[]
data modify entity @s Offers.Recipes set from storage gm4_balloon_animals:temp temp_source
