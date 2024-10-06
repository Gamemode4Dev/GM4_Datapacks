# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/augment/clocked

function gm4_survival_refightalized:player/health/calculate_hp

execute store result score $stored_bonus gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.stored_bonus

scoreboard players set $bonus gm4_aa_data 99
scoreboard players operation $bonus gm4_aa_data -= @s gm4_sr_health.percentage
scoreboard players operation $bonus gm4_aa_data /= #25 gm4_sr_data

execute unless score $bonus gm4_aa_data = $stored_bonus gm4_aa_data run function gm4_augmented_armor:armor/augment/type/raging/update
