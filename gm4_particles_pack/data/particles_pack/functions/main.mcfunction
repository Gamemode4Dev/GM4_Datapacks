execute as @e[type=armor_stand,scores={gm4_particle=1..}] at @s run function particles_pack:particle
execute as @e[type=area_effect_cloud,tag=gm4_particles_pack_cloud] at @s unless entity @e[type=armor_stand,scores={gm4_particle=1..},distance=..1] run kill @s

schedule function particles_pack:main
