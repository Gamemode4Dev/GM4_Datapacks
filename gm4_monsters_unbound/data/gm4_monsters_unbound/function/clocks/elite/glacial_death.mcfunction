# temporary clock for glacial elite death
# @s = unspecified
# at unspecified
# schedule from here
# schedule from mob/process/elite/glacial/death

scoreboard players set $keep_tick.elite_glacial_death gm4_mu_keep_tick 0
execute as @e[type=marker,tag=gm4_mu_elite.glacial_processing] at @s run function gm4_monsters_unbound:mob/process/elite/glacial/process_explosion

execute if score $keep_tick.elite_glacial_death gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/elite/glacial_death 2t
