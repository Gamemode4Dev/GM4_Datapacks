
scoreboard players set $keep_tick.elite_glacial_death gm4_mu_keep_tick 0
execute as @e[type=marker,tag=gm4_mu_elite.glacial_processing] at @s run function gm4_monsters_unbound:mob/process/elite/glacial/process_explosion

execute if score $keep_tick.elite_glacial_death gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/temp/elite_death_glacial 2t
