# Adds animal trades to the trader's trade pool.
# @s = a wandering trader without the gm4_calling_bell_trader tag (aka naturally spawned trader) with exactly 2 trader llamas
# at @s
# from gm4_balloon_animals:wandering_trader/init_trader

# calculate numbers based on summoned marker's UUID[0] and [3]
execute summon marker run function gm4_balloon_animals:wandering_trader/animal_one/random_calc
execute summon marker run function gm4_balloon_animals:wandering_trader/animal_two/random_calc

data modify storage gm4_balloon_animals:temp trader.uuid set from entity @s UUID

# 30% chance of a common animal, 70% chance of a rare animal
execute if score $a1_rare_calc gm4_balloon_animals_data matches 0..2 run function gm4_balloon_animals:wandering_trader/animal_one/choose_common
execute if score $a1_rare_calc gm4_balloon_animals_data matches 3..9 run function gm4_balloon_animals:wandering_trader/animal_one/choose_rare

execute if score $a2_rare_calc gm4_balloon_animals_data matches 0..2 run function gm4_balloon_animals:wandering_trader/animal_two/choose_common
execute if score $a2_rare_calc gm4_balloon_animals_data matches 3..9 run function gm4_balloon_animals:wandering_trader/animal_two/choose_rare
