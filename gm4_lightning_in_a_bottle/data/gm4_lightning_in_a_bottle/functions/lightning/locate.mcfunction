# A player near a lightning strike
# @s = player, near lightning strike
# at @s
# run from advancement, gm4_lightning_in_a_bottle:lightning_strike

advancement revoke @s only gm4_lightning_in_a_bottle:lightning_strike

# Check every lightning bolt
execute as @e[type=lightning_bolt,tag=!gm4_liab_processed] at @s run function gm4_lightning_in_a_bottle:lightning/check
