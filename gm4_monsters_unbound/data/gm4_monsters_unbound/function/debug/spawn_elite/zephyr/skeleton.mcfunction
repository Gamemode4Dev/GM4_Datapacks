
scoreboard players set $prepicked_elite gm4_mu_data 31
summon skeleton ~ ~ ~ {Tags:["gm4_mu_elite","gm4_mu_debug_mob"]}
execute if score gm4_survival_refightalized load.status matches 1.. as @n[tag=gm4_mu_debug_mob] run function gm4_survival_refightalized:mob/init/calc_difficulty_overworld
execute unless score gm4_survival_refightalized load.status matches 1.. as @n[tag=gm4_mu_debug_mob] run function gm4_monsters_unbound:mob/init/initialize
