
execute summon item_display run function gm4_combat_expanded:mob/process/elite/vorpal/init_fear_cloud
execute unless score $keep_tick.elite_death_vorpal gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_death_vorpal 1t
