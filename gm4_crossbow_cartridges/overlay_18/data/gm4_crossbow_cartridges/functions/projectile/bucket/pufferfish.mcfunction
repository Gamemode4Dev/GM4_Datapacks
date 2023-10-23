# Summon pufferfish
# @s = player using the crossbow
# at arrow
# run from projectile/bucket

# replace arrow with pufferfish and copy data
summon minecraft:pufferfish ~ ~ ~ {FromBucket:1b,Tags:["gm4_cb_projectile"],active_effects:[{id:'minecraft:regeneration',amplifier:10,duration:200,show_particles:0b}]}

execute as @e[type=minecraft:pufferfish,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# fish flop sound
playsound minecraft:entity.puffer_fish.flop player @a[distance=..15] ^ ^ ^1 2 .5

# shoot 2 more if using multishot
execute at @e[tag=gm4_cb_arrow,distance=..1,limit=2] run function gm4_crossbow_cartridges:projectile/bucket/multishot/pufferfish
