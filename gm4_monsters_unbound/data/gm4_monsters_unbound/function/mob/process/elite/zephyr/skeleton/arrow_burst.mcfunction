# shoot many arrows
# @s = zephyr elite
# at @s
# run from mob/process/elite/zephyr/process
# run from clocks/elite/zephyr_process

scoreboard players add @s gm4_mu_data 1

execute if score @s gm4_mu_data matches 16.. run return run function gm4_monsters_unbound:mob/process/elite/zephyr/lose_charge

scoreboard players set $keep_tick.elite_process_zephyr gm4_mu_keep_tick 1

execute anchored eyes positioned ^ ^ ^0.05 on target facing entity @s eyes summon arrow run function gm4_monsters_unbound:mob/process/elite/zephyr/skeleton/init_arrow
