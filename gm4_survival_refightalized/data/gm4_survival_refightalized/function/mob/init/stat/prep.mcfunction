# apply biome-specific modifiers randomize the stats
# @s = mobs that can be buffed
# at @s
# run from mob/init/mob_type

# remove bonus health if witch spawned in witch hut
execute if entity @s[type=witch,predicate=gm4_survival_refightalized:technical/in_witch_hut] run scoreboard players set $mob_health gm4_sr_data 0
# remove bonus health if enderman spawned in end
execute if entity @s[type=enderman] if dimension the_end run scoreboard players set $mob_health gm4_sr_data 0
# remove bonus damage if weapon is held
execute if predicate gm4_survival_refightalized:mob/has_weapon run scoreboard players set $mob_damage gm4_sr_data 0

# randomise stats - set values between 0 and current value based on:
# HEALTH = 0.5*score + BINOMDIST(n=0.5*score,p=0.5)
execute if score $mob_health gm4_sr_data matches 1.. store result score $mob_health gm4_sr_data run loot spawn 29999998 1 7133 loot gm4_survival_refightalized:mob/randomize_stats/health
# DAMAGE = 0.15*score + RANDOM(0 - 0.35*score) + BINOMDIST(n=0.5*score,p=0.5)
execute if score $mob_damage gm4_sr_data matches 1.. store result score $mob_damage gm4_sr_data run loot spawn 29999998 1 7133 loot gm4_survival_refightalized:mob/randomize_stats/damage
# SPEED = RANDOM(0 - 0.5*score) + BINOMDIST(n=0.5*score,p=0.5)
execute if score $mob_speed gm4_sr_data matches 1.. store result score $mob_speed gm4_sr_data run loot spawn 29999998 1 7133 loot gm4_survival_refightalized:mob/randomize_stats/speed

# store modifiers modified by difficulty
execute store result storage gm4_survival_refightalized:temp picked_stat.health float 0.01 run scoreboard players operation $mob_health gm4_sr_data *= $difficulty gm4_sr_data
execute store result storage gm4_survival_refightalized:temp picked_stat.damage float 0.001 run scoreboard players operation $mob_damage gm4_sr_data *= $difficulty gm4_sr_data
execute store result storage gm4_survival_refightalized:temp picked_stat.speed float 0.0001 run scoreboard players operation $mob_speed gm4_sr_data *= $difficulty gm4_sr_data

# evaluate stats and add modifiers to mob
function gm4_survival_refightalized:mob/init/stat/eval with storage gm4_survival_refightalized:temp picked_stat

# TODO: remove (spigot bug)
execute positioned 29999998 1 7133 run kill @e[type=item,distance=..2]
