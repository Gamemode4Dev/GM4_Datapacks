# apply biome-specific modifiers randomize the stats
# @s = mobs that can be buffed
# at @s
# run from functions in mob/init/mob_type/<MOB>

# | Biome Modifiers
# snowy
attribute @s[predicate=gm4_combat_expanded:mob/modifier/snowy] generic.movement_speed modifier add 8b68cb8f-b3ac-489b-bb24-ed6cca2fcacf "gm4_ce_modifier_snowy" -0.15 multiply
attribute @s[predicate=gm4_combat_expanded:mob/modifier/snowy] generic.max_health modifier add 9e950abf-f1d2-407d-a886-749059c29325 "gm4_ce_modifier_snowy" 0.15 multiply
# mountainous
attribute @s[predicate=gm4_combat_expanded:mob/modifier/mountainous] generic.attack_damage modifier add ba452899-be21-45b2-860c-c28947ba8c23 "gm4_ce_modifier_mountainous" 0.1 multiply
attribute @s[predicate=gm4_combat_expanded:mob/modifier/mountainous] generic.armor_toughness modifier add 899a6423-93ed-4293-bde3-d993a3c50d33 "gm4_ce_modifier_mountainous" 0.5 multiply
# burned
attribute @s[predicate=gm4_combat_expanded:mob/modifier/burned] generic.movement_speed modifier add 00a0987e-646e-4c9e-911e-8b07ad12df20 "gm4_ce_modifier_burned" 0.1 multiply
# flowering
# toxic
attribute @s[predicate=gm4_combat_expanded:mob/modifier/tocix] generic.attack_damage modifier add 0bb9ee29-b563-4cf7-b665-716391af0085 "gm4_ce_modifier_toxic" -0.25 multiply
# deep
attribute @s[predicate=gm4_combat_expanded:mob/modifier/deep] generic.armor_toughness modifier add 5f5931f9-24d8-41ae-bab1-1468b5c8f35c "gm4_ce_modifier_deep" 0.6 multiply
# reef
# growth
# dark
execute if predicate gm4_combat_expanded:mob/modifier/dark run function gm4_combat_expanded:mob/init/modifier/special/dark_mob

# remove bonus health if witch spawned in witch hut
execute if entity @s[type=witch,predicate=gm4_combat_expanded:technical/in_witch_hut] run scoreboard players set $mob_health gm4_ce_data 0
# remove bonus health if enderman spawned in end
execute if entity @s[type=enderman] if dimension the_end run scoreboard players set $mob_health gm4_ce_data 0

# randomise stats - set values between 0 and current value based on normal distribution
loot replace block 29999998 1 7134 container.0 loot gm4_combat_expanded:mob/randomize_stats
data modify storage gm4_combat_expanded:temp random_stats set from block 29999998 1 7134 Items[{Slot:0b}].tag.AttributeModifiers
execute store result score $mob_health gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_health"}].Amount
execute store result score $mob_damage gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_damage"}].Amount
execute store result score $mob_speed gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_speed"}].Amount
execute store result score $mob_armor gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_armor"}].Amount
execute store result score $mob_toughness gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_toughness"}].Amount

# store modifiers capped to a max value
execute store result storage gm4_combat_expanded:temp picked_stat.health float 1 run scoreboard players operation $mob_health gm4_ce_data < $mob_health.cap gm4_ce_data
execute store result storage gm4_combat_expanded:temp picked_stat.damage float 0.5 run scoreboard players operation $mob_damage gm4_ce_data < $mob_damage.cap gm4_ce_data
execute store result storage gm4_combat_expanded:temp picked_stat.speed float 0.02 run scoreboard players operation $mob_speed gm4_ce_data < $mob_speed.cap gm4_ce_data
execute store result storage gm4_combat_expanded:temp picked_stat.armor float 1 run scoreboard players operation $mob_armor gm4_ce_data < $mob_armor.cap gm4_ce_data
execute store result storage gm4_combat_expanded:temp picked_stat.toughness float 5 run scoreboard players operation $mob_toughness gm4_ce_data < $mob_toughness.cap gm4_ce_data

# evaluate stats and add modifiers to mob
function gm4_combat_expanded:mob/init/modifier/stat/eval with storage gm4_combat_expanded:temp picked_stat
