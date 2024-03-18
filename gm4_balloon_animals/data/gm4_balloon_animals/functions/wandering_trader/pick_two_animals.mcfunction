# Pick animal trades to spawn
# @s = a wandering trader without the gm4_calling_bell_trader tag (aka naturally spawned trader) with exactly 2 trader llamas
# at @s
# from gm4_balloon_animals:wandering_trader/init_trader

# run function twice

data modify storage gm4_balloon_animals:temp gm4_balloon_animals set value {animal:1b,trade:1b}
function gm4_balloon_animals:wandering_trader/trade/pick_animal

data modify storage gm4_balloon_animals:temp gm4_balloon_animals set value {animal:2b,trade:2b}
function gm4_balloon_animals:wandering_trader/trade/pick_animal
