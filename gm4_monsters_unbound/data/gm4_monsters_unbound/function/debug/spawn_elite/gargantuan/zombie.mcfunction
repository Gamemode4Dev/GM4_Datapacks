
scoreboard players set $prepicked_elite gm4_mu_data 96
summon zombie ~ ~ ~ {Tags:["gm4_sr_was_baby","gm4_mu_debug_mob"]}
execute as @n[tag=gm4_mu_debug_mob] run function gm4_survival_refightalized:mob/init/calc_difficulty_overworld
