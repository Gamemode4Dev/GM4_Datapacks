# @s = soul forge with an orb and shard
# located at the closest wither rose catcher that is Age:96
# run from soul_forge/wither_roses/steps

setblock ~ ~ ~ lily_of_the_valley
scoreboard players add @s gm4_oa_roses 1

# playsound
playsound entity.generic.eat block @a[distance=..12] ~ ~ ~ 0.7 0.75
playsound minecraft:block.grass.break block @a[distance=..12] ~ ~ ~ 0.6 1
playsound minecraft:entity.player.breath block @a[distance=..12] ~ ~ ~ 1 1.3

# particle
particle minecraft:cloud ~ ~0.6 ~ 0 0.8 0 0 5

# summon pretty entity line
summon marker ~ ~-1 ~ {Tags:["gm4_oa_wither_particle","gm4_unrotated_particle_cloud"],CustomName:'"Soul Forge Wither Particle"'}
teleport @e[type=marker,tag=gm4_unrotated_particle_cloud,limit=1] ~ ~-1 ~ facing entity @s eyes
teleport @e[type=marker,tag=gm4_unrotated_particle_cloud,limit=1] ~ ~1 ~
tag @e[type=marker,tag=gm4_unrotated_particle_cloud] remove gm4_unrotated_particle_cloud
