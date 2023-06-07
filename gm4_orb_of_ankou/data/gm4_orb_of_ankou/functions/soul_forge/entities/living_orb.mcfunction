# @s = soul forge to spawn an silverfish with a soul essence
# run from soul_forge/entities/summon_living_orb

# spawn silverfish
summon silverfish ~ ~0.2 ~ {CustomName:'{"translate":"entity.gm4.living_orb","fallback":"Living Orb§"}',CustomNameVisible:0,Team:"gm4_hide_name",Health:2.0f,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,Tags:["gm4_oa_unset","gm4_oa_living_orb","gm4_oa_ignore"],HandDropChances:[2.0f,1.0f],Motion:[0.0,0.6,0.0],ActiveEffects:[{Id:12,Amplifier:0b,Duration:1000000,ShowParticles:0b}]}

# set loot drop to orb of ankou
data modify entity @e[type=silverfish,tag=gm4_oa_unset,limit=1] HandItems[0] set from storage gm4_orb_of_ankou:temp Item

# randomize motion in x and z
execute as @e[type=silverfish,tag=gm4_oa_unset,limit=1] run function gm4_orb_of_ankou:soul_forge/entities/randomize_motion

# visuals
playsound minecraft:entity.silverfish.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1
