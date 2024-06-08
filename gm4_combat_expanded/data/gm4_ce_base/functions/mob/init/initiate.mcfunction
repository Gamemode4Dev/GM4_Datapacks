# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from mob/init/check_mob

# get difficulty score from the nearest player
scoreboard players operation $difficulty gm4_ce_data = @p[gamemode=!spectator] gm4_ce_difficult

# modify difficulty score based on some factors, starting with a randomized value
execute store result score $difficulty_mult gm4_ce_data run random value -10..10
# raining +20%
execute if predicate gm4_ce_base:technical/raining run scoreboard players add $difficulty_mult gm4_ce_data 20
# night & not in dark biome +0-40% based on moon phase
scoreboard players operation $moon_diff_add gm4_ce_data = $moon gm4_ce_data
scoreboard players operation $moon_diff_add gm4_ce_data *= #10 gm4_ce_data
execute unless predicate gm4_ce_base:mob/modifier/dark if predicate gm4_ce_base:technical/night_time run scoreboard players operation $difficulty_mult gm4_ce_data += $moon_diff_add gm4_ce_data
# dark biome +30%
execute if predicate gm4_ce_base:mob/modifier/dark run scoreboard players add $difficulty_mult gm4_ce_data 30

# function call to modify mob difficulty
# TODO

# home bed nearby-ish -40% and set a score to disable some mechanics
scoreboard players set $nearby_home_bed gm4_ce_data 0
execute as @e[type=marker,tag=gm4_ce_bed,distance=..128] run function gm4_ce_base:player/home/check_bed
execute if score $nearby_home_bed gm4_ce_data matches 1 run scoreboard players remove $difficulty_mult gm4_ce_data 40
# apply difficulty_mult
scoreboard players operation $difficulty_add gm4_ce_data = $difficulty gm4_ce_data
scoreboard players operation $difficulty_add gm4_ce_data *= $difficulty_mult gm4_ce_data
scoreboard players operation $difficulty_add gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data
# apply a flat diff increase and make sure difficulty is between 0 - 100
execute store result score $difficulty_flat gm4_ce_data run random value -5..5
scoreboard players operation $difficulty gm4_ce_data += $difficulty_flat gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data > #0 gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data < #100 gm4_ce_data

# reset scoreboard
scoreboard players reset $mob_extras gm4_ce_data
# initialize different mobs, starting with the base stats
# these can alter difficulty but cannot use it
function gm4_ce_base:mob/init/base_stats/check_type
function #gm4_ce_base:mob/init/difficulty

# process any extra spawned mobs
execute if score $mob_extras gm4_ce_data matches 1.. unless entity @s[tag=gm4_ce_extra_mob] as @e[tag=gm4_ce_extra_mob] at @s run function gm4_ce_base:mob/init/initiate

# if mob was replaced stop processing it
execute if score $replaced_mob gm4_ce_data matches 1 run return run scoreboard players reset $replaced_mob gm4_ce_data

# set modifiers that are based on difficulty
function gm4_ce_base:mob/init/apply/prep

# heal to max health
effect give @s[type=#gm4_ce_base:undead] instant_damage 1 20 true
effect give @s[type=!#gm4_ce_base:undead] instant_health 1 20 true

# store difficulty
scoreboard players operation @s gm4_ce_difficult.mob = $difficulty gm4_ce_data

# mark mob as initiated
tag @s add gm4_ce_processed
