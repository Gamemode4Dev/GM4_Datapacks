# give mount speed and secondary effects
# @s = vehicle of player with armor
# at @s
# run from armor/check_augment/equip

# store speed level, will be applied at the end
execute store result score $level_1 gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level_1 gm4_aa_data matches 3 run scoreboard players set $level_1 gm4_aa_data 4
scoreboard players operation @s gm4_aa_augment.equestrian.speed_level += $level_1 gm4_aa_data

# apply secondary effects
execute store result score $level_2 gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]
execute if score $level_2 gm4_aa_data matches 1 run effect give @s resistance 3 1 true
execute if score $level_2 gm4_aa_data matches 2 run effect give @s jump_boost 3 1 true
execute if score $level_2 gm4_aa_data matches 3 run effect give @s fire_resistance 3 0 true
execute if score $level_2 gm4_aa_data matches 4 run effect give @s regeneration 3 0 true
