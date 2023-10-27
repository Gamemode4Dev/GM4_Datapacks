# calculate the difficulty (https://docs.google.com/spreadsheets/d/1jxvFvZS6KcPjp3G8Qbb9rOcZZ8ukyBdGHxTFlA4fysA/edit?usp=sharing)
# @s = player not in spectator
# at unspecified
# run from slow_clock (every 5 min)

# difficulty calculations
# play_time increases by 1 every 5 minutes, up to 100
execute unless score @s gm4_ce_play_time matches 100.. run scoreboard players add @s gm4_ce_play_time 1
scoreboard players operation $playtime gm4_ce_difficult = @s gm4_ce_play_time

# add death multiplier
# remove death_mult from 100, then use that as the percentage of difficulty score to keep
scoreboard players set $death_mult gm4_ce_difficult 100
scoreboard players operation $death_mult gm4_ce_difficult -= @s gm4_ce_death_mult
scoreboard players operation $playtime gm4_ce_difficult *= $death_mult gm4_ce_difficult
scoreboard players operation $playtime gm4_ce_difficult /= #100 gm4_ce_data

# reduce death multiplier
# every 5 minutes since the last death removes 1 from death_mult
scoreboard players operation @s[scores={gm4_ce_death_mult=1..}] gm4_ce_death_mult -= @s gm4_ce_since_last_death
scoreboard players reset @s[scores={gm4_ce_death_mult=..0}] gm4_ce_death_mult
scoreboard players add @s gm4_ce_since_last_death 1

# get world difficulty
execute store result score $worlddiff gm4_ce_data run difficulty
# modify difficulty (*0.5 hard, *0.4 normal, *0.3 easy / other)
execute if score $worlddiff gm4_ce_data matches 3 run scoreboard players operation $playtime gm4_ce_difficult *= #50 gm4_ce_data
execute if score $worlddiff gm4_ce_data matches 2 run scoreboard players operation $playtime gm4_ce_difficult *= #40 gm4_ce_data
execute unless score $worlddiff gm4_ce_data matches 2..3 run scoreboard players operation $playtime gm4_ce_difficult *= #30 gm4_ce_data
scoreboard players operation $playtime gm4_ce_difficult /= #100 gm4_ce_data

# store difficulty in player score
scoreboard players operation @s gm4_ce_difficult = $playtime gm4_ce_difficult
