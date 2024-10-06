# store healing in 'healstore' which will be healed at the end of the player processing (this tick)
# @s = player to heal
# at unspecified
# run from armor/check_augment/killing

function gm4_survival_refightalized:player/health/calculate_hp

# healing is 10% of max health, rounded
scoreboard players operation $healing gm4_aa_data = @s gm4_sr_health.max
scoreboard players add $healing gm4_aa_data 5
scoreboard players operation $healing gm4_aa_data /= #10 gm4_aa_data

# store healing
scoreboard players operation @s gm4_sr_healstore += $healing gm4_aa_data
