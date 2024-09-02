# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from mob/init/calc_difficulty_else
# run from mob/init/calc_difficulty_overworld

scoreboard players operation $difficulty gm4_sr_data = $difficulty_base gm4_sr_data

# apply a random difficulty_mult to nudge difficulty around
execute store result score $difficulty_mult gm4_sr_data run random value -35..35
scoreboard players operation $difficulty_add gm4_sr_data = $difficulty gm4_sr_data
scoreboard players operation $difficulty_add gm4_sr_data *= $difficulty_mult gm4_sr_data
scoreboard players operation $difficulty_add gm4_sr_data /= #100 gm4_sr_data
scoreboard players operation $difficulty gm4_sr_data += $difficulty_add gm4_sr_data
# apply a random difficulty_flat to nudge difficulty around
execute store result score $difficulty_flat gm4_sr_data run random value -15..15
scoreboard players operation $difficulty gm4_sr_data += $difficulty_flat gm4_sr_data

# make sure difficulty is between 0 - 100
scoreboard players operation $difficulty gm4_sr_data > #0 gm4_sr_data
scoreboard players operation $difficulty gm4_sr_data < #100 gm4_sr_data

# store difficulty on mob
scoreboard players operation @s gm4_sr_mob_difficulty = $difficulty gm4_sr_data

# reset scoreboard
scoreboard players reset $mob_extras gm4_sr_data
# initialize different mobs
function gm4_survival_refightalized:mob/init/mob_type
# allow expansions to alter mobs
function #gm4_survival_refightalized:init_mob

# remove the damage bonus from hard difficulty if needed
execute if score $worlddiff gm4_sr_data matches 3 run attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.hard_difficulty_offset -0.333334 add_multiplied_total

# set modifiers
execute unless score $removed_mob gm4_sr_data matches 1 run function gm4_survival_refightalized:mob/init/stat/prep
scoreboard players reset $removed_mob gm4_sr_data

# heal to max health
effect give @s[type=#gm4_survival_refightalized:undead] instant_damage 1 20 true
effect give @s[type=!#gm4_survival_refightalized:undead] instant_health 1 20 true

# mark mob as initiated
tag @s add gm4_sr_processed

# process any spawned mobs
execute if score $mob_extras gm4_sr_data matches 1.. unless entity @s[tag=gm4_sr_extra_mob] as @e[type=#gm4_survival_refightalized:modify,tag=gm4_sr_extra_mob] at @s run function gm4_survival_refightalized:mob/init/initiate
tag @s remove gm4_sr_extra_mob
