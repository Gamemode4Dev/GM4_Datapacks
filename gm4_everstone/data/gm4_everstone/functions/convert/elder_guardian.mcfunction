# run from aging/guardian
# @s = guardian with high age score, at @s

summon minecraft:elder_guardian ~ ~ ~ {Tags:[gm4_es_new_mob],ActiveEffects:[{Id:9,Amplifier:1,Duration:30}]}
tp @e[type=elder_guardian,tag=gm4_es_new_mob,limit=1] @s

data modify entity @e[type=elder_guardian,tag=gm4_es_new_mob,limit=1] CustomName set from entity @s CustomName
data modify entity @e[type=elder_guardian,tag=gm4_es_new_mob,limit=1] PersistenceRequired set from entity @s PersistenceRequired
data modify entity @e[type=elder_guardian,tag=gm4_es_new_mob,limit=1] Health set from entity @s Health

playsound minecraft:entity.elder_guardian.ambient hostile @a[distance=..16] ~ ~ ~ 0.5
playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 0.5 .1
data merge entity @s {DeathTime:19s,Health:0}
tag @e[type=elder_guardian] remove gm4_es_new_mob
