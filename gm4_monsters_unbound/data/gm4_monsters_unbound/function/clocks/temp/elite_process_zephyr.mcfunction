
scoreboard players set $keep_tick.elite_process_zephyr gm4_mu_keep_tick 0
execute as @e[type=#gm4_survival_refightalized:skeleton_types,tag=gm4_mu_elite.zephyr_skeleton_burst] at @s run function gm4_monsters_unbound:mob/process/elite/zephyr/skeleton/arrow_burst

execute if score $keep_tick.elite_process_zephyr gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/temp/elite_process_zephyr 3t
