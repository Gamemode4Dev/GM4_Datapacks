
scoreboard players set $keep_tick.elite_frost_death gm4_ce_keep_tick 0
execute as @e[type=marker,tag=gm4_ce_elite.frost_processing] at @s run function gm4_combat_expanded:mob/process/elite/frost/process_explosion

execute if score $keep_tick.elite_frost_death gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_death_frost 2t
