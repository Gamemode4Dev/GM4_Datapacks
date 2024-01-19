# Gets 2 random numbers to choose between common or rare animal and which animal in those groups to put for trade
# @s = marker
# at @s, located at the trader
# from gm4_balloon_animals:wandering_trader/pick_two_animals

# check 30-70% chance of common-rare animal
execute store result score $a1_rare_calc gm4_balloon_animals_data run data get entity @s UUID[0]
scoreboard players operation $a1_rare_calc gm4_balloon_animals_data %= #10 gm4_balloon_animals_data


execute store result score $a1_choice gm4_balloon_animals_data run data get entity @s UUID[3]

execute if score $a1_rare_calc gm4_balloon_animals_data matches 0..2 run scoreboard players operation $a1_choice gm4_balloon_animals_data %= #10 gm4_balloon_animals_data
execute if score $a1_rare_calc gm4_balloon_animals_data matches 3..9 run scoreboard players operation $a1_choice gm4_balloon_animals_data %= #8 gm4_balloon_animals_data

# clean up
kill @s
