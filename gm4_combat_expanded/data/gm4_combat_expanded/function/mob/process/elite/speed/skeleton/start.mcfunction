
tag @s add gm4_ce_elite.speed_skeleton_burst
scoreboard players set @s gm4_ce_data 0
execute unless score $keep_tick.elite_process_speed gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_process_speed 2t
