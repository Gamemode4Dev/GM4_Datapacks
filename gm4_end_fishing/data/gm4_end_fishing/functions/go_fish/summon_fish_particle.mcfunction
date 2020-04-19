#@s = fishing bait armor stand that is nearly ready to be reeled in
#run from process

scoreboard players operation seed gm4_ef_data *= mult gm4_ef_data
scoreboard players operation seed gm4_ef_data += incr gm4_ef_data
scoreboard players operation result gm4_ef_data = seed gm4_ef_data
scoreboard players operation result gm4_ef_data /= #4 gm4_ef_data
scoreboard players operation result gm4_ef_data %= #4 gm4_ef_data

execute if score result gm4_ef_data matches 0 run summon area_effect_cloud ~ ~ ~3 {Duration:32,Particle:"block air",Tags:[gm4_ef_particle_set]}
execute if score result gm4_ef_data matches 1 run summon area_effect_cloud ~ ~ ~-3 {Duration:32,Particle:"block air",Tags:[gm4_ef_particle_set]}
execute if score result gm4_ef_data matches 2 run summon area_effect_cloud ~3 ~ ~ {Duration:32,Particle:"block air",Tags:[gm4_ef_particle_set]}
execute if score result gm4_ef_data matches 3 run summon area_effect_cloud ~-3 ~ ~ {Duration:32,Particle:"block air",Tags:[gm4_ef_particle_set]}
execute at @e[type=area_effect_cloud,tag=gm4_ef_particle_set] run tp @e[type=area_effect_cloud,tag=gm4_ef_particle_set,limit=1,distance=..0.01] ~ ~ ~ facing entity @s eyes
tag @e[type=area_effect_cloud,tag=gm4_ef_particle_set] add gm4_ef_particle
tag @e[type=area_effect_cloud,tag=gm4_ef_particle_set] remove gm4_ef_particle_set
