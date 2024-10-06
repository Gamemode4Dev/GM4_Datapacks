# grant immunity tags to player depending on the armor worn
# @s = player wearing immune armour below 50% health
# at unspecified
# run from armor/augment/clocked

# get levels
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute store result score $level_2 gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]

# get effects to become immune to
execute if score $level gm4_aa_data matches 1 run tag @s add gm4_aa_effect_immunity.mining_fatigue
execute if score $level gm4_aa_data matches 2 run tag @s add gm4_aa_effect_immunity.poison
execute if score $level gm4_aa_data matches 3 run tag @s add gm4_aa_effect_immunity.weakness
execute if score $level gm4_aa_data matches 4 run tag @s add gm4_aa_effect_immunity.hunger
execute if score $level gm4_aa_data matches 5 run tag @s add gm4_aa_effect_immunity.blind
execute if score $level gm4_aa_data matches 6 run tag @s add gm4_aa_effect_immunity.nausea
execute if score $level gm4_aa_data matches 7 run tag @s add gm4_aa_effect_immunity.wither

execute if score $level_2 gm4_aa_data matches 1 run tag @s add gm4_aa_effect_immunity.mining_fatigue
execute if score $level_2 gm4_aa_data matches 2 run tag @s add gm4_aa_effect_immunity.poison
execute if score $level_2 gm4_aa_data matches 3 run tag @s add gm4_aa_effect_immunity.weakness
execute if score $level_2 gm4_aa_data matches 4 run tag @s add gm4_aa_effect_immunity.hunger
execute if score $level_2 gm4_aa_data matches 5 run tag @s add gm4_aa_effect_immunity.blind
execute if score $level_2 gm4_aa_data matches 6 run tag @s add gm4_aa_effect_immunity.nausea
execute if score $level_2 gm4_aa_data matches 7 run tag @s add gm4_aa_effect_immunity.wither

# remove effects if they were present
effect clear @s[tag=gm4_aa_effect_immunity.mining_fatigue] mining_fatigue
effect clear @s[tag=gm4_aa_effect_immunity.poison] poison
effect clear @s[tag=gm4_aa_effect_immunity.weakness] weakness
effect clear @s[tag=gm4_aa_effect_immunity.hunger] hunger
effect clear @s[tag=gm4_aa_effect_immunity.blind] blindness
effect clear @s[tag=gm4_aa_effect_immunity.nausea] nausea
effect clear @s[tag=gm4_aa_effect_immunity.wither] wither

# tag for effect removal
tag @s add gm4_aa_effect_immunity.active
