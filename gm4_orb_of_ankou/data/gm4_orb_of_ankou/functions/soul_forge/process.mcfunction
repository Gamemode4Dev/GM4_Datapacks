# @s = soul forge with multiblock
# run from main

# ambient particles
particle minecraft:soul_fire_flame ~ ~0.5 ~ 0.2 1 0.2 0.01 7
particle minecraft:soul ~ ~0.5 ~ 0.3 1 0.3 0.01 3

# colored smoke for ingredients
execute if score @s gm4_oa_powder matches 1.. run particle dust 0.459 0.200 0.090 2 ~ ~0.2 ~ 0.1 0.8 0.1 0.03 6 force
execute if score @s gm4_oa_glowstone matches 1.. run particle dust 0.459 0.431 0.055 2 ~ ~0.2 ~ 0.1 0.8 0.1 0.03 6 force
execute if score @s gm4_oa_tears matches 1.. run particle dust 0.384 0.451 0.459 2 ~ ~0.2 ~ 0.1 0.8 0.1 0.03 6 force
execute if score @s gm4_oa_roses matches 1.. run particle dust 0.204 0.165 0.259 2 ~ ~0.2 ~ 0.1 0.8 0.1 0.03 6 force
execute if score @s gm4_oa_essence matches 1.. run particle dust 0.180 0.169 0.310 2 ~ ~0.2 ~ 0.1 0.8 0.1 0.03 6 force
execute if entity @s[tag=gm4_oa_has_orb] run particle dust 0.725 0.729 0.780 2 ~ ~0.2 ~ 0.1 0.8 0.1 0.03 6 force
execute if entity @s[tag=gm4_oa_has_shard] run particle dust 0.271 0.149 0.388 2 ~ ~0.2 ~ 0.1 0.8 0.1 0.03 6 force

# wither rose consumption
execute if entity @s[tag=gm4_oa_has_orb,tag=gm4_oa_has_shard] run function gm4_orb_of_ankou:soul_forge/wither_roses/steps

# wither rose particle line
execute as @e[type=marker,tag=gm4_oa_wither_particle] at @s run function gm4_orb_of_ankou:soul_forge/wither_roses/particle
