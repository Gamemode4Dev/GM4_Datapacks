
$attribute @s generic.max_absorption modifier add gm4_sr_absorption_reduced -$(absorption_reduction) add_value
# restore absorption cap after 4 ticks to let it remove the health
scoreboard players set @s gm4_sr_absorp_reduced_timer 3
schedule function gm4_survival_refightalized:player/health/damaged/restore_absorption_clock 1t
