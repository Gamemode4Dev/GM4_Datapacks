# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/augment/clocked

function gm4_survival_refightalized:player/health/calculate_hp

execute store result score $stored_missing_hp gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.stored_missing_hp

scoreboard players operation $missing_health gm4_aa_data = @s gm4_sr_health.max
scoreboard players operation $missing_health gm4_aa_data -= @s gm4_sr_health.current

execute unless score $missing_health gm4_aa_data = $stored_missing_hp gm4_aa_data run function gm4_augmented_armor:armor/augment/type/sustaining/update
