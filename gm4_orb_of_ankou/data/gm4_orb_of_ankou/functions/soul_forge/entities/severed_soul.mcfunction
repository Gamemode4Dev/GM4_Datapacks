# @s = soul forge to spawn an endermite with a soul essence
# run from both soul_forge/entities/summon_failed_essence and soul_forge/entities/summon_congealed_essence

# spawn endermite
summon endermite ~ ~0.2 ~ {CustomName:'{"translate":"entity.gm4.severed_soul","fallback":"Severed Soul§"}',CustomNameVisible:0,Team:"gm4_hide_name",Health:2.0f,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,Tags:["gm4_oa_unset","gm4_oa_severed_soul","gm4_oa_ignore"],HandDropChances:[2.0f,1.0f],Motion:[0.0,0.6,0.0],ActiveEffects:[{Id:12,Amplifier:0b,Duration:1000000,ShowParticles:0b}]}

# set loot drop to soul essence
data modify entity @e[type=endermite,tag=gm4_oa_unset,limit=1] HandItems[0] set from storage gm4_orb_of_ankou:temp ArmorItems[0]

# randomize motion in x and z
execute as @e[type=endermite,tag=gm4_oa_unset,limit=1] run function gm4_orb_of_ankou:soul_forge/entities/randomize_motion

# visuals
playsound minecraft:entity.endermite.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1
