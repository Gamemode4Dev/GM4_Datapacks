# @s = soul forge to spawn an bat with a soul essence
# run from soul_forge/entities/summon_congealed_shard

# spawn bat
summon bat ~ ~0.2 ~ {CustomName:'{"translate":"entity.gm4.congealed_shard","fallback":"Congealed Soul Shard§"}',CustomNameVisible:0,Team:"gm4_hide_name",Health:2.0f,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,Tags:["gm4_oa_unset","gm4_oa_congealed_shard","gm4_oa_ignore","gm4_defused_bat"],HandDropChances:[2.0f,1.0f],Motion:[0.0,0.6,0.0],ActiveEffects:[{Id:12,Amplifier:0b,Duration:1000000,ShowParticles:0b}]}

# set loot drop to soul shard
data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1] HandItems[0] set from storage gm4_orb_of_ankou:temp Item

# randomize motion in x and z
execute as @e[type=bat,tag=gm4_oa_unset,limit=1] run function gm4_orb_of_ankou:soul_forge/entities/randomize_motion

# visuals
playsound minecraft:entity.bat.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1
