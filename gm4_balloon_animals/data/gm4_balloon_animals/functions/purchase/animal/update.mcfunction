# Tag and complete the ownership of the purchased balloon animal to the player
# @s = purchased balloon animal
# at wandering trader, player just traded with
# run from purchase/animal/search

tag @s add gm4_balloon_animal_purchased
scoreboard players set $trade_success gm4_balloon_animals_data 1

# switch the leasher from the trader to the player
data modify entity @s leash.UUID set from storage gm4_balloon_animals:temp player.uuid

# don't know why but having all of these in one file prevents the above line from working properly
tag @s add gm4_balloon_animal_newly_purchased
schedule function gm4_balloon_animals:purchase/animal/locate_cleanse 10t
