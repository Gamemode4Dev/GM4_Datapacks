
scoreboard players set $keep_tick.elite_death_vorpal gm4_mu_keep_tick 0
execute as @e[type=item_display,tag=gm4_mu_elite.fear_cloud] at @s run function gm4_monsters_unbound:mob/process/elite/vorpal/process_fear_cloud

execute if score $keep_tick.elite_death_vorpal gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/temp/elite_death_vorpal 1t
