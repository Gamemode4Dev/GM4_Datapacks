
$attribute @s generic.max_absorption modifier add gm4_ce_absorption_reduced -$(absorption_reduction) add_value
# restore absorption cap after 4 ticks to let it remove the health
scoreboard players set @s gm4_ce_absorp_reduced_timer 3
schedule function gm4_combat_expanded:clocks/temp/restore_absorption 1t
