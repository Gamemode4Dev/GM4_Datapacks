
scoreboard players set $keep_tick.elite_process_speed gm4_ce_keep_tick 0
execute as @e[type=skeleton,tag=gm4_ce_elite.speed_skeleton_burst] at @s run function gm4_combat_expanded:mob/process/elite/speed/skeleton/arrow_burst

execute if score $keep_tick.elite_process_speed gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_process_speed 3t
