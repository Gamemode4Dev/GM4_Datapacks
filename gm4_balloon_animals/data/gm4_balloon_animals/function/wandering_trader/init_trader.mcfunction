# @s = a wandering trader with exactly 2 trader llamas
# at @s
# run from wandering_trader/check_eligibility

# mark that this trader was modified
tag @s add gm4_balloon_animal_trader

# find leashed llamas
tag @s add gm4_balloon_animal_trader_new
execute as @e[type=trader_llama,tag=!smithed.entity,distance=..6] run function gm4_balloon_animals:wandering_trader/llama/check_leasher
tag @s remove gm4_balloon_animal_trader_new

# pick two animals and set up trades
data modify storage gm4_balloon_animals:temp trades set value []
function gm4_balloon_animals:wandering_trader/pick_two_animals

# copy trades list to entity custom data
data modify entity @s data.gm4_balloon_animals.trades set from storage gm4_balloon_animals:temp trades
data remove storage gm4_balloon_animals:temp trades
