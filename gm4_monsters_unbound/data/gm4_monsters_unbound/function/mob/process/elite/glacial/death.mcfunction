# run on glacial elite death
# @s = glacial elite
# at @s
# run from mob/process/elite/on_death/run

summon marker ~ ~-1 ~ {Tags:["gm4_mu_elite_death_marker","gm4_mu_elite.glacial_processing"]}
execute unless score $keep_tick.elite_glacial_death gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/elite/glacial_death 1t
