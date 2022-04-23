#@s = soul glass AEC
#run from main and beacon_clock

execute if score @s gm4_sg_primary matches 1.. unless block ~ ~ ~ brown_stained_glass if block ~ ~-1 ~ beacon run function gm4_soul_glass:effect/revert_effects

particle minecraft:smoke ~ ~ ~ 0.3 0.3 0.3 0 15 normal
