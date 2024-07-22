
scoreboard players add @s gm4_ce_data 1

execute if score @s gm4_ce_data matches 16.. run return run function gm4_combat_expanded:mob/process/elite/zephyr/lose_charge

scoreboard players set $keep_tick.elite_process_zephyr gm4_ce_keep_tick 1

execute anchored eyes positioned ^ ^ ^0.05 on target facing entity @s eyes summon arrow run function gm4_combat_expanded:mob/process/elite/zephyr/skeleton/init_arrow
