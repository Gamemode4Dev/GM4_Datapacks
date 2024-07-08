# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from mob/init/calc_difficulty_base

scoreboard players operation $difficulty gm4_ce_data = $difficulty_base gm4_ce_data

# apply a random difficulty_mult to nudge difficulty around
execute store result score $difficulty_mult gm4_ce_data run random value -25..25
scoreboard players operation $difficulty_add gm4_ce_data = $difficulty gm4_ce_data
scoreboard players operation $difficulty_add gm4_ce_data *= $difficulty_mult gm4_ce_data
scoreboard players operation $difficulty_add gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data
# apply a random difficulty_flat to nudge difficulty around
execute store result score $difficulty_flat gm4_ce_data run random value -10..10
scoreboard players operation $difficulty gm4_ce_data += $difficulty_flat gm4_ce_data

# make sure difficulty is between 0 - 100
scoreboard players operation $difficulty gm4_ce_data > #0 gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data < #100 gm4_ce_data

# store difficulty on mob
scoreboard players operation @s gm4_ce_difficult.mob = $difficulty gm4_ce_data

# home bed nearby-ish set a score to disable some mechanics
scoreboard players set $nearby_home_bed gm4_ce_data 0
execute as @e[type=marker,tag=gm4_ce_bed,distance=..128] run function gm4_combat_expanded:player/home/check_bed

# reset scoreboard
scoreboard players reset $mob_extras gm4_ce_data
# initialize different mobs
function gm4_combat_expanded:mob/init/mob_type

# heal to max health
effect give @s[type=#gm4_combat_expanded:undead] instant_damage 1 20 true
effect give @s[type=!#gm4_combat_expanded:undead] instant_health 1 20 true

# mark mob as initiated
tag @s add gm4_ce_processed

# process any spawned mobs
execute if score $mob_extras gm4_ce_data matches 1.. unless entity @s[tag=gm4_ce_extra_mob] as @e[tag=gm4_ce_extra_mob] at @s run function gm4_combat_expanded:mob/init/initiate
tag @s remove gm4_ce_extra_mob
