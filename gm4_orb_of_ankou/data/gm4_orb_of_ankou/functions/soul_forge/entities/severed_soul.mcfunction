# @s = soul forge to spawn an endermite with a soul essence
# run from both soul_forge/entities/summon_failed_essence and soul_forge/entities/summon_congealed_essence

# spawn endermite
summon endermite ~ ~0.2 ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Severed Soul",{"translate":"entity.gm4.severed_soul"}]}',CustomNameVisible:0,Health:2.0f,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,Tags:["gm4_oa_unset","gm4_oa_severed_soul","gm4_oa_ignore"],HandDropChances:[2.0f,1.0f],Motion:[0.0,0.6,0.0],ActiveEffects:[{Id:12b,Amplifier:0b,Duration:1000000,ShowParticles:0b}]}

# set loot drop to soul essence
data modify entity @e[type=endermite,limit=1,sort=nearest,tag=gm4_oa_unset] HandItems[0] set from entity @s ArmorItems[0]

# randomize motion in x and z
execute as @e[type=endermite,limit=1,sort=nearest,tag=gm4_oa_unset] run function gm4_orb_of_ankou:soul_forge/entities/randomize_motion

# visuals
playsound minecraft:entity.endermite.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1
