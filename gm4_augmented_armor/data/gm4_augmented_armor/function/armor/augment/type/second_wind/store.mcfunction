# store portion of damage taken in score
# @s = player being checked
# at @s
# run from armor/augment/type/second_wind/check

execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1] 2

scoreboard players operation $store_health gm4_aa_data = @s gm4_aa_stat.damage_taken
scoreboard players operation $store_health gm4_aa_data *= $level gm4_aa_data
scoreboard players operation @s gm4_aa_augment.rejuvenating.stored_health += $store_health gm4_aa_data

playsound minecraft:item.bottle.empty player @s ~ ~ ~ 0.6 2
