# apply biome-specific modifiers randomize the stats
# @s = mobs that can be buffed
# at @s
# run from functions in mob/init/mob_type/<MOB>

# | Biome Modifiers
# snowy
attribute @s[predicate=gm4_combat_expanded:mob/modifier/snowy] generic.movement_speed modifier add gm4_combat_expanded:stat_change.snowy -0.15 add_multiplied_base
attribute @s[predicate=gm4_combat_expanded:mob/modifier/snowy] generic.max_health modifier add gm4_combat_expanded:stat_change.snowy 0.15 add_multiplied_base
# mountainous
attribute @s[predicate=gm4_combat_expanded:mob/modifier/mountainous] generic.armor modifier add gm4_combat_expanded:stat_change.mountainous 0.25 add_multiplied_base
attribute @s[predicate=gm4_combat_expanded:mob/modifier/mountainous] generic.armor_toughness modifier add gm4_combat_expanded:stat_change.mountainous 0.5 add_multiplied_base
# burned
attribute @s[predicate=gm4_combat_expanded:mob/modifier/burned] generic.movement_speed modifier add gm4_combat_expanded:stat_change.burned 0.1 add_multiplied_base
# toxic
attribute @s[predicate=gm4_combat_expanded:mob/modifier/toxic] generic.attack_damage modifier add gm4_combat_expanded:stat_change.toxic -0.25 add_multiplied_base
# deep
attribute @s[predicate=gm4_combat_expanded:mob/modifier/deep] generic.armor_toughness modifier add gm4_combat_expanded:stat_change.deep 0.6 add_multiplied_base
# dark
execute if predicate gm4_combat_expanded:mob/modifier/dark run function gm4_combat_expanded:mob/init/modifier/special/dark_mob

# remove bonus health if witch spawned in witch hut
execute if entity @s[type=witch,predicate=gm4_combat_expanded:technical/in_witch_hut] run scoreboard players set $mob_health gm4_ce_data 0
# remove bonus health if enderman spawned in end
execute if entity @s[type=enderman] if dimension the_end run scoreboard players set $mob_health gm4_ce_data 0
# remove bonus damage if weapon is held, then set droprate to 20% (unless in "Dark")
execute if predicate gm4_combat_expanded:mob/has_weapon run scoreboard players set $mob_damage gm4_ce_data 0
execute if score $mob_damage gm4_ce_data matches 0 run data modify entity @s[predicate=!gm4_combat_expanded:mob/modifier/dark] HandDropChances set value [0.20F,0.20F]
# randomise stats - set values between 0 and current value based on:
# HEALTH = 0.5*score + BINOMDIST(n=0.5*score,p=0.5)
execute if score $mob_health gm4_ce_data matches 1.. store result score $mob_health gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:mob/randomize_stats/health
# DAMAGE = 0.15*score + RANDOM(0 - 0.35*score) + BINOMDIST(n=0.5*score,p=0.5)
execute if score $mob_damage gm4_ce_data matches 1.. store result score $mob_damage gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:mob/randomize_stats/damage
# SPEED = RANDOM(0 - 0.5*score) + BINOMDIST(n=0.5*score,p=0.5)
execute if score $mob_speed gm4_ce_data matches 1.. store result score $mob_speed gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:mob/randomize_stats/speed
# ARMOR = 0.25*score + RANDOM(0 - 0.25*score) + BINOMDIST(n=0.5*score,p=0.5)
execute if score $mob_armor gm4_ce_data matches 1.. store result score $mob_armor gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:mob/randomize_stats/armor
# TOUGHNESS = 0.25*score + RANDOM(0 - 0.75*score)
execute if score $mob_toughness gm4_ce_data matches 1.. store result score $mob_toughness gm4_ce_data run loot spawn 29999998 1 7133 loot gm4_combat_expanded:mob/randomize_stats/toughness

# store modifiers modified by difficulty
execute store result storage gm4_combat_expanded:temp picked_stat.health float 0.01 run scoreboard players operation $mob_health gm4_ce_data *= $difficulty gm4_ce_data
execute store result storage gm4_combat_expanded:temp picked_stat.damage float 0.001 run scoreboard players operation $mob_damage gm4_ce_data *= $difficulty gm4_ce_data
execute store result storage gm4_combat_expanded:temp picked_stat.speed float 0.0001 run scoreboard players operation $mob_speed gm4_ce_data *= $difficulty gm4_ce_data
execute store result storage gm4_combat_expanded:temp picked_stat.armor float 0.01 run scoreboard players operation $mob_armor gm4_ce_data *= $difficulty gm4_ce_data
execute store result storage gm4_combat_expanded:temp picked_stat.toughness float 0.01 run scoreboard players operation $mob_toughness gm4_ce_data *= $difficulty gm4_ce_data

# evaluate stats and add modifiers to mob
function gm4_combat_expanded:mob/init/modifier/stat/eval with storage gm4_combat_expanded:temp picked_stat

# tag to check for damage cap (1 tick later to make sure the weapon is counted as well)
tag @s add gm4_ce_check_damage_cap

# TODO: remove (spigot bug)
execute positioned 29999998 1 7133 run kill @e[type=item,distance=..2]
