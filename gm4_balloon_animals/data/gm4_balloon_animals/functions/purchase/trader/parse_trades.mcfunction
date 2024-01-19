# Checks each trader's trade for a gm4_balloon_animals.trade nbt
# @s = wandering trader, tag=gm4_balloon_animal_trader
# at player
# run from gm4_balloon_animals:purchase/trades/search and self

data modify storage gm4_balloon_animals:temp tempSource append from storage gm4_balloon_animals:temp trades[0]
data remove storage gm4_balloon_animals:temp trades[0]

# if current trade is a balloon animal trade, check if it is the one we are looking for
execute store success score $trade_applicable gm4_balloon_animals_data if data storage gm4_balloon_animals:temp tempSource[-1].sell.tag.gm4_balloon_animals.trade
execute if score $trade_applicable gm4_balloon_animals_data matches 1 run function gm4_balloon_animals:purchase/trader/check_trade

# if any remaining trades, continue looping
execute store result score $trade_count gm4_balloon_animals_data run data get storage gm4_balloon_animals:temp trades
execute if score $trade_found gm4_balloon_animals_data matches 0 if score $trade_count gm4_balloon_animals_data matches 1.. run function gm4_balloon_animals:purchase/trader/parse_trades
