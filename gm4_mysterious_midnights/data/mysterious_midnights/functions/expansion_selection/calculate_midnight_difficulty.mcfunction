#@s = none
#at world spawn
#run from calculate_moon_phase, only during full moon nights, only once per full moon night
say mysterious_midnights.calculate_midnight_difficulty

#generate random number from 0 to 15
execute store result score random gm4_nights_data run data get entity @e[limit=1,sort=random] UUIDMost 0.00000000002273064325381162890625
scoreboard players operation random gm4_nights_data %= 16 gm4_nights_data

#DEBUG
#scoreboard players set random gm4_nights_data 13

#manipulate moon_phase to cancel 53% of mysterious_midnights
execute if score random gm4_nights_data matches 0..8 run scoreboard players set moon_phase gm4_nights_data 1

#remember that a mysterious midnight was attempted
scoreboard players set send_night_end_pulse gm4_nights_data 1

#select expansion depending on rarity, in case a mysterious midnight occured
execute if score random gm4_nights_data matches 9.. run function mysterious_midnights:expansion_selection/start_expansion
