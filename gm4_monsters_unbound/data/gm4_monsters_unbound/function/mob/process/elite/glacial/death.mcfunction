
tag @s remove gm4_mu_elite_death_marker
tag @s add gm4_mu_elite.glacial_processing

tp @s ~ ~-1 ~

scoreboard players set @s gm4_mu_data 0
execute unless score $keep_tick.frost_elite gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/temp/elite_death_glacial 1t
