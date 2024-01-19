# Update the uses count for balloon animal trader's trade
# @s = wandering trader, tag=gm4_balloon_animal_trader
# at player
# run from gm4_balloon_animals:purchase/trades/check_specific

# update trade, such that uses (2) > maxUses (1)
data modify storage gm4_balloon_animals:temp tempSource[-1].uses set value 2b

# update trader with the updated trade
data modify storage gm4_balloon_animals:temp tempSource append from storage gm4_balloon_animals:temp trades[]
data modify entity @s Offers.Recipes set from storage gm4_balloon_animals:temp tempSource
