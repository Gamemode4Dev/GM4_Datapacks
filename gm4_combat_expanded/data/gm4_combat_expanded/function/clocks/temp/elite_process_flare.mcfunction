
scoreboard players set $keep_tick.elite_process_flare gm4_ce_keep_tick 0
execute as @e[type=block_display,tag=gm4_ce_elite_flare] at @s run function gm4_combat_expanded:mob/process/elite/blazing/process_flare

execute if score $keep_tick.elite_process_flare gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_process_flare 1t
