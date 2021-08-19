# @s = new area_effect_cloud (particle cloud)
# at @s
# run from particle_cloud

# set particle from book
data modify entity @s Particle set from storage gm4_better_armour_stands:temp pages[1]

# remove "banned" particles
tag @s[nbt={Particle:"minecraft:elder_guardian"}] add gm4_particle_kill

# update particle score or remove cloud
execute unless entity @s[tag=gm4_particle_kill] run scoreboard players set @e[type=minecraft:armor_stand,tag=gm4_particle_target,distance=..1,sort=nearest,limit=1] gm4_particle 100
execute if entity @s[tag=gm4_particle_kill] run kill @s

# set cloud size
data modify entity @s Radius set value 1
execute if data storage gm4_better_armour_stands:temp {pages:["small"]} run data modify entity @s Radius set value 0.01

# remove new tag
tag @s remove gm4_particles_pack_cloud_new
