# @s = soul forge to spawn an bat with a soul essence
# run from soul_forge/entities/summon_congealed_shard

# spawn bat
summon bat ~ ~0.2 ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Congealed Soul Shard§",{"translate":"entity.gm4.congealed_shard"}]}',CustomNameVisible:0,Health:2.0f,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,Tags:["gm4_oa_unset","gm4_oa_congealed_shard","gm4_oa_ignore","gm4_defused_bat"],HandDropChances:[2.0f,1.0f],Motion:[0.0,0.6,0.0],ActiveEffects:[{Id:12b,Amplifier:0b,Duration:1000000,ShowParticles:0b}]}

# set loot drop to soul shard
data modify entity @e[type=bat,limit=1,sort=nearest,tag=gm4_oa_unset] HandItems[0] set from entity @s Item

# randomize motion in x and z
execute as @e[type=bat,limit=1,sort=nearest,tag=gm4_oa_unset] run function gm4_orb_of_ankou:soul_forge/entities/randomize_motion

# visuals
playsound minecraft:entity.bat.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1
