
scoreboard players set $prepicked_elite gm4_mu_data 76
summon skeleton ~ ~ ~ {Tags:["gm4_mu_elite","gm4_mu_debug_mob"]}
execute as @n[tag=gm4_mu_debug_mob] run function gm4_survival_refightalized:mob/init/calc_difficulty_overworld
