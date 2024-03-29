# calculate the red health of player calling this function and store in scoreboard gm4_ce_health.current
# $max_health and $half_health in gm4_ce_data temporaraly store max and half of max health
# @s = player to calculate health from
# at unspecified
# run from armor/modifier/type/hp_check
# run from armor/modifier/type/link/process/damage_taken
# run from armor/modifier/type/link/general
# run from player/heal/heal_calc
# run from player/regen/check
# run from weapon/modifier/delay/explode_player

# get max health
execute store result score @s gm4_ce_health.max run attribute @s minecraft:generic.max_health get

# calculate half of max health
scoreboard players operation @s gm4_ce_health.max_half = @s gm4_ce_health.max
scoreboard players operation @s gm4_ce_health.max_half /= #2 gm4_ce_data

# calculate current health (only red hearts)
# Health stores as float, but minecraft displays as int rounded up, this
# mimics that so the value always matches what the player sees
execute store result score @s gm4_ce_health.current run data get entity @s Health 10
scoreboard players add @s gm4_ce_health.current 9
scoreboard players operation @s gm4_ce_health.current /= #10 gm4_ce_data
