# Granted upon purchasing a balloon animal from a wandering trader
# @s = trading player
# at @s
# run from advancement, gm4_balloon_animals:purchased_animal

data modify storage gm4_balloon_animals:temp player.uuid set from entity @s UUID

# locate trader
execute as @e[type=wandering_trader,tag=gm4_balloon_animal_trader,limit=1,sort=nearest] run function gm4_balloon_animals:purchase/trader/search

advancement grant @s only gm4:balloon_animals

# clean up
tag @e[type=wandering_trader,tag=gm4_balloon_animal_trader_processed] remove gm4_balloon_animal_trader_processed
tag @e[tag=gm4_balloon_animal_processed] remove gm4_balloon_animal_processed
clear @s lead{gm4_balloon_animals:{animal:1b,trade:1b}}
clear @s lead{gm4_balloon_animals:{animal:2b,trade:2b}}
advancement revoke @s only gm4_balloon_animals:purchased_animal
