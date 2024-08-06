
scoreboard players set $keep_tick.elite_process_flare gm4_mu_keep_tick 0
execute as @e[type=block_display,tag=gm4_mu_elite_flare] at @s run function gm4_monsters_unbound:mob/process/elite/blazing/process_flare

execute if score $keep_tick.elite_process_flare gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/temp/elite_process_flare 1t
