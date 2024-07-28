
scoreboard players set $keep_tick.elite_process_zephyr gm4_ce_keep_tick 0
execute as @e[type=#gm4_combat_expanded:skeleton_types,tag=gm4_ce_elite.zephyr_skeleton_burst] at @s run function gm4_combat_expanded:mob/process/elite/zephyr/skeleton/arrow_burst

execute if score $keep_tick.elite_process_zephyr gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_process_zephyr 3t
