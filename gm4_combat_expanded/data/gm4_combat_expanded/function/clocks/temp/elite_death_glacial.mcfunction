
scoreboard players set $keep_tick.elite_glacial_death gm4_ce_keep_tick 0
execute as @e[type=marker,tag=gm4_ce_elite.glacial_processing] at @s run function gm4_combat_expanded:mob/process/elite/glacial/process_explosion

execute if score $keep_tick.elite_glacial_death gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_death_glacial 2t
