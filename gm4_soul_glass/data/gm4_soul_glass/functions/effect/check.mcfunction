#@s = soul glass AEC
#run from beacon_clock

execute unless block ~ ~-1 ~ beacon{Primary:0} run function gm4_soul_glass:effect/update_effects

execute store result score @s gm4_sg_levels run data get block ~ ~-1 ~ Levels

execute if score @s gm4_sg_primary = @s gm4_sg_secondary run function gm4_soul_glass:effect/apply_strong_effect
execute unless score @s gm4_sg_primary = @s gm4_sg_secondary run function gm4_soul_glass:effect/apply_normal_effect
