# run from tick
# @s = entity with a delayed strike
# at @s

# progress
scoreboard players add @s gm4_ce_t_delay 1
execute if score @s gm4_ce_t_delay matches 30.. run function gm4_combat_evolved:weapon/modifiers/delay/explode

# particles
execute if score @s gm4_ce_t_delay matches 10 anchored eyes run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0 3
execute if score @s gm4_ce_t_delay matches 20 anchored eyes run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0 3
