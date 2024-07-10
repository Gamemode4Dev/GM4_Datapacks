
scoreboard players add @s gm4_ce_data 1

execute if score @s gm4_ce_data matches 16.. run return run function gm4_combat_expanded:mob/process/elite/speed/lose_charge

scoreboard players set $keep_tick.elite_process_speed gm4_ce_keep_tick 1

execute anchored eyes positioned ^ ^ ^0.05 on target facing entity @s eyes summon arrow run function gm4_combat_expanded:mob/process/elite/speed/skeleton/init_arrow
