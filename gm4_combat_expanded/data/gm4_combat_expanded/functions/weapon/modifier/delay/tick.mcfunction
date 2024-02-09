# advance the delayed damage timer, activate after 2 seconds
# @s = entity with a delayed strike
# at @s
# run from weapon/modifier/delay/clock

scoreboard players set $keep_tick.delay gm4_ce_keep_tick 1

# progress
scoreboard players add @s gm4_ce_t_delay 1
execute if score @s[type=!player] gm4_ce_t_delay matches 40.. run function gm4_combat_expanded:weapon/modifier/delay/explode_entity
execute if score @s[type=player] gm4_ce_t_delay matches 40.. run function gm4_combat_expanded:weapon/modifier/delay/explode_player

# particles
execute if score @s gm4_ce_t_delay matches 10 anchored eyes run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0 1
execute if score @s gm4_ce_t_delay matches 20 anchored eyes run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0 3
execute if score @s gm4_ce_t_delay matches 30 anchored eyes run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0 5
