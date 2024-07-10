
tag @s remove gm4_ce_elite_death_marker
tag @s add gm4_ce_elite.frost_processing

tp @s ~ ~-1 ~

scoreboard players set @s gm4_ce_data 0
execute unless score $keep_tick.frost_elite gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_death_frost 1t
