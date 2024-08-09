
execute summon item_display run function gm4_monsters_unbound:mob/process/elite/vorpal/init_fear_cloud
execute unless score $keep_tick.elite_death_vorpal gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/temp/elite_death_vorpal 1t
