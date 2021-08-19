# @s = armor_stand
# at @s
# run from apply_book

kill @e[type=area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..1,sort=nearest,limit=1]
scoreboard players reset @s gm4_particle

# set particle cloud
summon area_effect_cloud ~ ~1 ~ {CustomName:'"gm4_particle_cloud"',Tags:["gm4_particles_pack_cloud","gm4_particles_pack_cloud_new"],Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:"minecraft:elder_guardian"}

# new cloud checks
tag @s add gm4_particle_target
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_particles_pack_cloud_new,distance=..1,sort=nearest,limit=1] run function gm4_particles_pack:new_cloud
tag @s remove gm4_particle_target
