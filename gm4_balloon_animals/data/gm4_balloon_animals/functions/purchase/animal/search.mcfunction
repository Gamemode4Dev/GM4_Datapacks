# Searches through unpurchased balloon animals for the one that matches the id of the recently purchased animal
# @s = a random animal, tag=gm4_balloon_animal,tag=!gm4_balloon_animal_purchased
# at wandering trader, player just traded with
# run from purchase/trader/check_trade

# load animal score id
execute store result score $id gm4_balloon_animals_data run data get storage gm4_balloon_animals:temp temp_source[-1].sell.components."minecraft:custom_data".gm4_balloon_animals.id

# checks all unpurchased balloon animals, if their id matches the recently purchased one then continue
execute as @e[type=#gm4_balloon_animals:balloon_animal,tag=gm4_balloon_animal,tag=!gm4_balloon_animal_purchased] if score @s gm4_balloon_animals_id = $id gm4_balloon_animals_data run function gm4_balloon_animals:purchase/animal/update

# if animal not found, refund player (in purchased_animal)
execute unless score $trade_success gm4_balloon_animals_data matches 1 run playsound entity.villager.no neutral @a[distance=..8] ~ ~ ~
