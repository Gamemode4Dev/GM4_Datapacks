# run from aging/slime
# @s = slime with high age score, at @s

summon minecraft:magma_cube ~ ~ ~ {Tags:[gm4_es_new_mob],ActiveEffects:[{Id:9,Amplifier:1,Duration:30}]}
tp @e[type=magma_cube,tag=gm4_es_new_mob,limit=1] @s

data modify entity @e[type=magma_cube,tag=gm4_es_new_mob,limit=1] CustomName set from entity @s CustomName
data modify entity @e[type=magma_cube,tag=gm4_es_new_mob,limit=1] PersistenceRequired set from entity @s PersistenceRequired
data modify entity @e[type=magma_cube,tag=gm4_es_new_mob,limit=1] Health set from entity @s Health

data modify entity @e[type=magma_cube,tag=gm4_es_new_mob,limit=1] Size set from entity @s Size


playsound entity.magma_cube.squish hostile @a[distance=..16] ~ ~ ~ 0.5
playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 0.5 .1
data merge entity @s {DeathTime:19s,Health:0,DeathLootTable:"minecraft:empty"}
tp @s ~ -150 ~
tag @e[type=magma_cube] remove gm4_es_new_mob
