# process a players death
# @s = player not in spectator
# at unspecified
# run from player/process (if player has just (re)spawned)

# disable modifiers 
scoreboard players set @s gm4_ce_burning.duration 0
scoreboard players reset @s gm4_ce_burning.level

# update death_mult
# multiply death_mult score by 0.75, then add 20
scoreboard players operation @s gm4_ce_death_mult *= #75 gm4_ce_data
scoreboard players operation @s gm4_ce_death_mult /= #100 gm4_ce_data
scoreboard players add @s gm4_ce_death_mult 20
scoreboard players set @s gm4_ce_since_last_death 0

# reset deaths
scoreboard players reset @s gm4_ce_deaths

# re-calculate the difficulty (https://docs.google.com/spreadsheets/d/1jxvFvZS6KcPjp3G8Qbb9rOcZZ8ukyBdGHxTFlA4fysA/edit?usp=sharing)

# difficulty calculations
scoreboard players operation $playtime gm4_ce_data = @s gm4_ce_play_time

# add death multiplier
# remove death_mult from 100, then use that as the percentage of difficulty score to keep
scoreboard players set $death_mult gm4_ce_data 100
scoreboard players operation $death_mult gm4_ce_data -= @s gm4_ce_death_mult
scoreboard players operation $playtime gm4_ce_data *= $death_mult gm4_ce_data
scoreboard players operation $playtime gm4_ce_data /= #100 gm4_ce_data

# get world difficulty
execute store result score $worlddiff gm4_ce_data run difficulty
# modify difficulty (*0.5 hard, *0.4 normal, *0.3 easy / other)
execute if score $worlddiff gm4_ce_data matches 3 run scoreboard players operation $playtime gm4_ce_data *= #50 gm4_ce_data
execute if score $worlddiff gm4_ce_data matches 2 run scoreboard players operation $playtime gm4_ce_data *= #40 gm4_ce_data
execute unless score $worlddiff gm4_ce_data matches 2..3 run scoreboard players operation $playtime gm4_ce_data *= #30 gm4_ce_data
scoreboard players operation $playtime gm4_ce_data /= #100 gm4_ce_data

# store difficulty in player score
scoreboard players operation @s gm4_ce_difficult = $playtime gm4_ce_data
