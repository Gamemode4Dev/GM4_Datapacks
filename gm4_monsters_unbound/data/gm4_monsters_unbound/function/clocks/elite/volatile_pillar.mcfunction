# temporary clock for volatile elite pillars
# @s = unspecified
# at unspecified
# schedule from here
# schedule from mob/process/elite/volatile/pillar_location

scoreboard players set $keep_tick.elite_pillar_volatile gm4_mu_keep_tick 0
execute as @e[type=marker,tag=gm4_mu_elite.volatile_pillar] at @s run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_process

execute if score $keep_tick.elite_pillar_volatile gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/elite/volatile_pillar 1t
