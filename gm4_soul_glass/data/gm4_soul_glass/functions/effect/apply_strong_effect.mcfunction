#@s = soul glass AEC
#run from effects/check

execute if score @s gm4_sg_levels matches 1 positioned ~-20 ~-21 ~-20 run function gm4_soul_glass:effect/level_1_strong
execute if score @s gm4_sg_levels matches 2 positioned ~-30 ~-31 ~-30 run function gm4_soul_glass:effect/level_2_strong
execute if score @s gm4_sg_levels matches 3 positioned ~-40 ~-41 ~-40 run function gm4_soul_glass:effect/level_3_strong
execute if score @s gm4_sg_levels matches 4 positioned ~-50 ~-51 ~-50 run function gm4_soul_glass:effect/level_4_strong
