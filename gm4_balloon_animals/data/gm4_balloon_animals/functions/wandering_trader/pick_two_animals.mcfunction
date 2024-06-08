# @s = a wandering trader with no trader llamas, tag=gm4_balloon_animal_trader,tag=gm4_balloon_animal_trader_new
# at @s
# run from wandering_trader/init_trader

data modify storage gm4_balloon_animals:temp gm4_balloon_animals set value {trade:1b}
function gm4_balloon_animals:wandering_trader/trade/pick_animal

data modify storage gm4_balloon_animals:temp gm4_balloon_animals set value {trade:2b}
function gm4_balloon_animals:wandering_trader/trade/pick_animal
