# store healing in 'healstore' which will be healed at the end of the player processing (this tick)
# @s = player to heal
# at unspecified
# run from armor/check_augment/killing

function gm4_survival_refightalized:player/health/calculate_hp

# healing is 5% of max health per kill, rounded
scoreboard players operation $healing gm4_aa_data = @s gm4_sr_stat.max_health
scoreboard players operation $healing gm4_aa_data *= #5 gm4_aa_data
scoreboard players operation $healing gm4_aa_data *= @s gm4_aa_stat.kills
scoreboard players add $healing gm4_aa_data 50
scoreboard players operation $healing gm4_aa_data /= #100 gm4_aa_data

# store healing
scoreboard players operation @s gm4_sr_health.restoration += $healing gm4_aa_data
