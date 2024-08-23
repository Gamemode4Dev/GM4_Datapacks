
summon marker ~ ~-1 ~ {Tags:["gm4_mu_elite_death_marker","gm4_mu_elite.glacial_processing"]}
execute unless score $keep_tick.elite_glacial_death gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/temp/elite_death_glacial 1t
