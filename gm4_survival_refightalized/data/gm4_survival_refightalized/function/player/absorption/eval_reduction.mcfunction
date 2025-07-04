# reduce absorption hearts on player based on their score
# @s = damaged player
# at @s
# run from player/damage/calculate_damage

$attribute @s max_absorption modifier add gm4_sr_absorption_reduced -$(absorption_reduction) add_value
# restore absorption cap after 4 ticks to let it remove the health properly
scoreboard players set @s gm4_sr_health.absorption_reduction_timer 3
schedule function gm4_survival_refightalized:player/absorption/restore_clock 1t

scoreboard players reset $damage_absorption gm4_sr_data
