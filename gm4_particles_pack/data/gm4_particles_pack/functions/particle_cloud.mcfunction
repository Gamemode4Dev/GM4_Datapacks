# @s = armor_stand ..1 from writable_book
# run from apply_book

scoreboard players set @s gm4_particle 1000

# set particle cloud
summon area_effect_cloud ~ ~1 ~ {Radius:1,RadiusOnUse:0,Particle:"minecraft:composter",Duration:2147483647,Tags:["gm4_particles_pack_cloud","gm4_particles_pack_cloud_new"]}
data modify entity @e[type=minecraft:area_effect_cloud,tag=gm4_particles_pack_cloud_new,distance=..1,sort=nearest,limit=1] Particle set from storage gm4_better_armour_stands:temp pages[1]

# set cloud size
execute if data storage gm4_better_armour_stands:temp {pages:["small"]} run data merge entity @e[type=minecraft:area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..10,sort=nearest,limit=1] {Radius:0.01f}
execute if data storage gm4_better_armour_stands:temp {pages:["big"]} run data merge entity @e[type=minecraft:area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..10,sort=nearest,limit=1] {Radius:3f}

# new cloud checks
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_particles_pack_cloud_new] run function gm4_particles_pack:new_cloud
