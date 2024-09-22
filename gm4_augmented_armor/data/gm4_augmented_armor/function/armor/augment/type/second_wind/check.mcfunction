# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/check_augment/safety

# activate armor if player is regenerating
execute if score @s[tag=!gm4_aa_augment.rejuvenating.stored_health.active] gm4_aa_stat.damage_taken matches 1.. run function gm4_augmented_armor:armor/augment/type/second_wind/activate

# translate damage taken to stored health if armor is active
execute if score @s[tag=gm4_aa_augment.rejuvenating.stored_health.active] gm4_aa_stat.damage_taken matches 1.. at @s run function gm4_augmented_armor:armor/augment/type/second_wind/store

# restore health when player is safe
execute unless score @s[tag=gm4_aa_augment.rejuvenating.stored_health.active] gm4_aa_in_combat matches 1.. at @s run function gm4_augmented_armor:armor/augment/type/second_wind/restore
  