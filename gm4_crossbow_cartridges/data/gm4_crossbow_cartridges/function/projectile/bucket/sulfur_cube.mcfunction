# Summon sulfur cube
# @s = player using the crossbow
# at arrow
# run from projectile/bucket

# replace arrow with sulfur cube and copy data
summon minecraft:sulfur_cube ~ ~ ~ {from_bucket:1b,Size:1,Tags:["gm4_cb_projectile"],active_effects:[{id:'minecraft:regeneration',amplifier:10,duration:200,show_particles:0b}]}

data modify storage gm4_crossbow_cartridges:temp projectile.Age merge from entity @s equipment.offhand.components."minecraft:bucket_entity_data".age
data modify storage gm4_crossbow_cartridges:temp projectile.AgeLocked merge from entity @s equipment.offhand.components."minecraft:bucket_entity_data".age_locked
data modify storage gm4_crossbow_cartridges:temp projectile.equipment.body set from entity @s equipment.offhand.components."minecraft:sulfur_cube_content"
execute as @e[type=minecraft:sulfur_cube,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# sulfur cube sound
playsound minecraft:entity.sulfur_cube.squish player @a[distance=..15] ^ ^ ^1 2 1

# shoot 2 more if using multishot
execute at @e[tag=gm4_cb_arrow,distance=..1,limit=2] run function gm4_crossbow_cartridges:projectile/bucket/multishot/sulfur_cube
