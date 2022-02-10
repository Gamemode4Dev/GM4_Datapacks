# run from aging/vindicator
# @s = vindicator with high age score, at @s

summon minecraft:evoker ~ ~ ~ {Tags:[gm4_es_new_mob],ActiveEffects:[{Id:9,Amplifier:1,Duration:30}]}
tp @e[type=evoker,tag=gm4_es_new_mob,limit=1] @s

data modify entity @e[type=evoker,tag=gm4_es_new_mob,limit=1] CustomName set from entity @s CustomName
data modify entity @e[type=evoker,tag=gm4_es_new_mob,limit=1] PersistenceRequired set from entity @s PersistenceRequired
data modify entity @e[type=evoker,tag=gm4_es_new_mob,limit=1] Health set from entity @s Health

playsound minecraft:entity.evoker.ambient hostile @a[distance=..16] ~ ~ ~ 0.5
playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 0.5 .1
data merge entity @s {DeathTime:19s,Health:0,DeathLootTable:"minecraft:empty"}
tag @e[type=evoker] remove gm4_es_new_mob
