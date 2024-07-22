
tag @s add gm4_ce_elite.zephyr_skeleton_burst
scoreboard players set @s gm4_ce_data 0
execute unless score $keep_tick.elite_process_zephyr gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_process_zephyr 2t
