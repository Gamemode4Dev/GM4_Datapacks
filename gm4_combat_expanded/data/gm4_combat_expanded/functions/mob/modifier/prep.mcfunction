# apply biome-specific modifiers randomize the stats
# @s = mobs that can be buffed
# at @s
# run from functions in mob/mob_types/

# biome specific modifiers for any mob
execute if predicate gm4_combat_expanded:mob/modifier/dark run scoreboard players add $mob_stats gm4_ce_data 3
execute if predicate gm4_combat_expanded:mob/modifier/snowy run scoreboard players add $mob_health gm4_ce_data 8
execute if predicate gm4_combat_expanded:mob/modifier/snowy run attribute @s generic.movement_speed modifier add 8b68cb8f-b3ac-489b-bb24-ed6cca2fcacf "gm4_ce_modifier_snowy" -0.15 multiply_base
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run scoreboard players add $mob_damage gm4_ce_data 2
execute if predicate gm4_combat_expanded:mob/modifier/burned run scoreboard players add $mob_speed gm4_ce_data 3
execute if predicate gm4_combat_expanded:mob/modifier/toxic run attribute @s generic.attack_damage modifier add 6cc324d6-32af-49cb-a3d0-c7c9982cdb65 "gm4_ce_modifier_toxic" -0.25 multiply
execute if predicate gm4_combat_expanded:mob/modifier/deep run scoreboard players add $mob_toughness gm4_ce_data 1

# translate general stat+ to their stats
scoreboard players operation $mob_health gm4_ce_data += $mob_stats gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data += $mob_stats gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data += $mob_stats gm4_ce_data

# randomise stats - set values between 0 and current value based on normal distribution
loot replace block 29999998 1 7134 container.0 loot gm4_combat_expanded:mob/randomize_stats
data modify storage gm4_combat_expanded:temp random_stats set from block 29999998 1 7134 Items[{Slot:0b}].tag.AttributeModifiers
execute store result score $mob_health gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_health"}].Amount
execute store result score $mob_damage gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_damage"}].Amount
execute store result score $mob_speed gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_speed"}].Amount
execute store result score $mob_armor gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_armor"}].Amount
execute store result score $mob_toughness gm4_ce_data run data get storage gm4_combat_expanded:temp random_stats[{Name:"gm4_ce_mob_toughness"}].Amount

# remove bonus health if witch spawned in witch hut
execute if entity @s[type=witch,predicate=gm4_combat_expanded:technical/in_witch_hut] run scoreboard players set $mob_health gm4_ce_data 0

# add modifiers that have been altered
execute if score $mob_health gm4_ce_data matches 1.. run function gm4_combat_expanded:mob/modifier/health
execute if score $mob_damage gm4_ce_data matches 1.. run function gm4_combat_expanded:mob/modifier/damage
execute if score $mob_speed gm4_ce_data matches 1.. run function gm4_combat_expanded:mob/modifier/speed
execute if score $mob_armor gm4_ce_data matches 1.. run function gm4_combat_expanded:mob/modifier/armor
execute if score $mob_toughness gm4_ce_data matches 1.. run function gm4_combat_expanded:mob/modifier/toughness
