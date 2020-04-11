#@s = soul glass AEC
#run from main and beacon_clock

execute unless block ~ ~ ~ brown_stained_glass unless block ~ ~ ~ moving_piston unless block ~ ~ ~-1 brown_stained_glass unless block ~ ~ ~1 brown_stained_glass unless block ~-1 ~ ~ brown_stained_glass unless block ~1 ~ ~ brown_stained_glass run kill @s

execute if score @s gm4_sg_primary matches 1.. unless block ~ ~ ~ brown_stained_glass if block ~ ~-1 ~ beacon run function gm4_soul_glass:effect/revert_effects
execute if block ~ ~ ~ brown_stained_glass unless block ~ ~-1 ~ beacon run function gm4_soul_glass:destroy

particle smoke ~ ~ ~ 0.3 0.3 0.3 0 15 normal
