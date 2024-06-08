#@s = soul glass AEC
#run from beacon_clock

execute if data block ~ ~-1 ~ primary_effect run function gm4_soul_glass:effect/update_effects

execute store result score @s gm4_sg_levels run data get block ~ ~-1 ~ Levels

execute if score @s gm4_sg_levels matches 1 positioned ~-20 ~-21 ~-20 run function gm4_soul_glass:effect/level_1
execute if score @s gm4_sg_levels matches 2 positioned ~-30 ~-31 ~-30 run function gm4_soul_glass:effect/level_2
execute if score @s gm4_sg_levels matches 3 positioned ~-40 ~-41 ~-40 run function gm4_soul_glass:effect/level_3
execute if score @s gm4_sg_levels matches 4 if score @s gm4_sg_primary = @s gm4_sg_secondary positioned ~-50 ~-51 ~-50 run function gm4_soul_glass:effect/level_4_strong
execute if score @s gm4_sg_levels matches 4 unless score @s gm4_sg_primary = @s gm4_sg_secondary positioned ~-50 ~-51 ~-50 run function gm4_soul_glass:effect/level_4
