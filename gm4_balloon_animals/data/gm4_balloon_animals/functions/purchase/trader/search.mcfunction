# Search through traders' trades to find the trade that activated the advancement
# @s = wandering trader, tag=gm4_balloon_animal_trader
# at player
# run from gm4_balloon_animals:purchase/locate_trader

# reset end values
scoreboard players set $trade_found gm4_balloon_animals_data 0
data remove storage gm4_balloon_animals:temp tempSource

# load trades, prepare for search
data modify storage gm4_balloon_animals:temp trades set from entity @s Offers.Recipes

function gm4_balloon_animals:purchase/trader/parse_trades

tag @s add gm4_balloon_animal_trader_processed

# if not the trader we are looking for, loop unprocessed traders
execute if score $trade_found gm4_balloon_animals_data matches 0 as @e[type=wandering_trader,tag=!smithed.entity,tag=gm4_balloon_animal_trader,tag=!gm4_balloon_animal_trader_processed,limit=1] run function gm4_balloon_animals:purchase/trader/search
