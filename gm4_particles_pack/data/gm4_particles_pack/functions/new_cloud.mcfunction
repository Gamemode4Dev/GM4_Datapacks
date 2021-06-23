# @s = new area_effect_cloud
# run from apply_book

# remove new tag
tag @s remove gm4_particles_pack_cloud_new

# armour stand invisible if valid particle
execute unless entity @s[nbt={Particle:"minecraft:composter"}] positioned ~ ~1 ~ run data merge entity @e[type=minecraft:armor_stand,distance=..1,sort=nearest,limit=1] {Invisible:1b}

# remove particle cloud if no valid particle
kill @s[nbt={Particle:"minecraft:composter"}]
