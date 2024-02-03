# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from mob/init/check_mob

# get difficulty score from the nearest player
scoreboard players operation $difficulty gm4_ce_data = @p[gamemode=!spectator] gm4_ce_difficult

# modify difficulty score based on some factors, starting with a randomized value
execute store result score $difficulty_mult gm4_ce_data run random value -10..10
# raining +20%
execute if predicate gm4_combat_expanded:technical/raining run scoreboard players add $difficulty_mult gm4_ce_data 20
# night & not in dark biome +0-40% based on moon phase
scoreboard players operation $moon_diff_add gm4_ce_data = $moon gm4_ce_data
scoreboard players operation $moon_diff_add gm4_ce_data *= #10 gm4_ce_data
execute unless predicate gm4_combat_expanded:mob/modifier/dark if predicate gm4_combat_expanded:technical/night_time run scoreboard players operation $difficulty_mult gm4_ce_data += $moon_diff_add gm4_ce_data
# dark biome +30%
execute if predicate gm4_combat_expanded:mob/modifier/dark run scoreboard players add $difficulty_mult gm4_ce_data 30
# mountainous +20%
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run scoreboard players add $difficulty_mult gm4_ce_data 20
# home bed nearby-ish -40% and set a score to disable some mechanics
scoreboard players set $nearby_home_bed gm4_ce_data 0
execute as @e[type=marker,tag=gm4_ce_bed,distance=..128] run function gm4_combat_expanded:player/home/check_bed
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
# initialize different mobs
execute if entity @s[type=#gm4_combat_expanded:zombie_types] run function gm4_combat_expanded:mob/init/mob_type/zombie
execute if entity @s[type=skeleton] run function gm4_combat_expanded:mob/init/mob_type/skeleton
execute if entity @s[type=stray] run function gm4_combat_expanded:mob/init/mob_type/skeleton
execute if entity @s[type=spider] run function gm4_combat_expanded:mob/init/mob_type/spider
execute if entity @s[type=cave_spider] run function gm4_combat_expanded:mob/init/mob_type/cave_spider
execute if entity @s[type=creeper] run function gm4_combat_expanded:mob/init/mob_type/creeper
execute if entity @s[type=slime] run function gm4_combat_expanded:mob/init/mob_type/slime
execute if entity @s[type=magma_cube] run function gm4_combat_expanded:mob/init/mob_type/slime
execute if entity @s[type=enderman] run function gm4_combat_expanded:mob/init/mob_type/enderman
execute if entity @s[type=phantom] run function gm4_combat_expanded:mob/init/mob_type/phantom
execute if entity @s[type=wither_skeleton] run function gm4_combat_expanded:mob/init/mob_type/wither_skeleton
execute if entity @s[type=piglin] run function gm4_combat_expanded:mob/init/mob_type/piglin
execute if entity @s[type=pillager] run function gm4_combat_expanded:mob/init/mob_type/pillager
execute if entity @s[type=vindicator] run function gm4_combat_expanded:mob/init/mob_type/vindicator
execute if entity @s[type=zombified_piglin] run function gm4_combat_expanded:mob/init/mob_type/zombified_piglin
execute if entity @s[type=hoglin] run function gm4_combat_expanded:mob/init/mob_type/hoglin
execute if entity @s[type=#gm4_combat_expanded:basic_modifiers_only] run function gm4_combat_expanded:mob/init/mob_type/other

# heal to max health
effect give @s[type=#gm4_combat_expanded:undead] instant_damage 1 20 true
effect give @s[type=!#gm4_combat_expanded:undead] instant_health 1 20 true

# process any spawned mobs
execute if score $mob_extras gm4_ce_data matches 1.. unless entity @s[tag=gm4_ce_extra_mob] as @e[tag=gm4_ce_extra_mob] at @s run function gm4_combat_expanded:mob/init/initiate
tag @s remove gm4_ce_extra_mob

# store difficulty
scoreboard players operation @s gm4_ce_difficult.mob = $difficulty gm4_ce_data

# mark mob as initiated
tag @s add gm4_ce_processed
